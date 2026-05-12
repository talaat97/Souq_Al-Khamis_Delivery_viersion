import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_al_khamis_delivey_version/core/services/notification/notification_ui_service.dart';

class NotificationsHelper {
  NotificationsHelper._();

  static final NotificationsHelper instance = NotificationsHelper._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  bool isFetching = false;
  int retryCount = 0;

  // 🔥 PUBLIC INIT
  Future<void> init() async {
    await requestPermission();
    configFCM();

    await tryGetToken();
  }

  Future<void> tryGetToken() async {
    if (isFetching) return;

    isFetching = true;

    try {
      String token = await _messaging.getToken() ?? "";

      if (token.isNotEmpty) {
        await _saveToken(token);
      }

      retryCount = 0;

      print("✅ FCM Token: $token");
    } catch (e) {
      print("❌ Token failed: $e");
      _scheduleRetry();
    } finally {
      isFetching = false;
    }
  }

  void _scheduleRetry() {
    retryCount++;

    final delaySeconds = (5 * retryCount).clamp(5, 60);

    print("🔁 Retrying in $delaySeconds seconds...");

    Future.delayed(Duration(seconds: delaySeconds), () {
      tryGetToken();
    });
  }

  // 🔐 PERMISSION
  Future<void> requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // 📩 FCM LISTENERS
  void configFCM() {
    FirebaseMessaging.onMessage.listen((message) {
      if (Get.key.currentContext != null) {
        FlutterRingtonePlayer().playNotification();

        NotificationUIService.showBanner(
          title: message.notification?.title ?? "Notification",
          body: message.notification?.body ?? "",
        );
      }
    });

    // 🔄 TOKEN REFRESH (IMPORTANT)
    _messaging.onTokenRefresh.listen((newToken) async {
      print("🔄 Token refreshed: $newToken");
      await _saveToken(newToken);
    });
  }

  Future<bool> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      print("✅ Subscribed to topic: $topic");
      return true;
    } catch (e) {
      print("❌ Failed to subscribe to topic: $topic : $e");
      return false;
    }
  }

  Future<bool> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      print("🚫 Unsubscribed from topic: $topic");
      return true;
    } catch (e) {
      print("❌ Failed to unsubscribe from topic: $topic : $e");
      return false;
    }
  }

  // 💾 Save token to SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token', token);
    print("💾 FCM token saved to SharedPreferences");
  }

  // 📖 Read token from SharedPreferences (call this anywhere)
  static Future<String> getStoredToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token') ?? '';
  }
}
