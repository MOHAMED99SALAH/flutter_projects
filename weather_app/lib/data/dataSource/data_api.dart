import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/weather_module.dart';

class Weather_API {
  weather_module model;

  Future<dynamic> getweather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=f11d2077b967bedab4e5f4a6ef0afc64");

    if (result.statusCode != 200) {
      return 1;
    }

    final jsondecod = json.decode(result.body);
    final jsonweather = jsondecod["main"];

    model = weather_module.fromjson(jsonweather);
    return model;
  }
}
