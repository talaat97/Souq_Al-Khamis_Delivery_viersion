import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteService {
  static const String apiKey = "AIzaSyBqq68A2bUFEE0ZTTk84lS_fAgv3wdKzoo";

  static Future<List<LatLng>> getPolyline({
    required double originLat,
    required double originLng,
    required double destLat,
    required double destLng,
  }) async {

    final url =
        "https://maps.googleapis.com/maps/api/directions/json"
        "?origin=$originLat,$originLng"
        "&destination=$destLat,$destLng"
        "&key=AIzaSyBqq68A2bUFEE0ZTTk84lS_fAgv3wdKzoo";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Failed to load route");
    }

    final data = jsonDecode(response.body);

    final route = data['routes'][0];
    final encodedPolyline = route['overview_polyline']['points'];

    return _decodePolyline(encodedPolyline);
  }

  // 🔓 Decode Google encoded polyline
  static List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }
}