import '../dataSource/data_api.dart';
import '../models/weather_module.dart';

class WeatherRepo {
  final Weather_API data;

  WeatherRepo(this.data);

  Future<dynamic> getTempereture(String city) async {
    if (await data.getweather(city) == 1) {
      return 1;
    }

    Weather_module model = await data.getweather(city);

    return model;
  }

  Future<String> getlocation() async {
    return data.getLocation();
  }
}
