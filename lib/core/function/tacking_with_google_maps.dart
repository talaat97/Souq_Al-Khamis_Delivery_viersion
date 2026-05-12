import 'package:url_launcher/url_launcher.dart';

openGoogleMaps({
  required double originLat,
  required double originLng,
  required double destLat,
  required double destLng,
}) async {
  final url = "https://www.google.com/maps/dir/?api=1"
      "&origin=$originLat,$originLng"
      "&destination=$destLat,$destLng"
      "&travelmode=driving";

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
