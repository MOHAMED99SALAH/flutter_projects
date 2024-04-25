import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/weather_module.dart';

class Weather_API {
  Weather_module? model;

  Future<dynamic> getweather(String city) async {
    final result = await http.Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=f11d2077b967bedab4e5f4a6ef0afc64"));

    if (result.statusCode != 200) {
      return 1;
    }

    final jsondecod = json.decode(result.body);
    final jsonweather = jsondecod;

    var model = Weather_module.fromjson(jsonweather);
    return model;
  }

  Future<String> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placmark =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);

    String? city = placmark[0].locality;

    return city ?? "";
  }
}
