import '../dataSource/data_api.dart';
import '../models/weather_module.dart';

class weatherRepo {
  final Weather_API data;

  weatherRepo(this.data);

  Future<dynamic> getTempereture(String city) async {
    if (await data.getweather(city) == 1) {
      return 1;
    }

    weather_module model = await data.getweather(city);

    return model;
  }
}
