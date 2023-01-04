class Weather_module {
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;

  double get getTemp => temp - 272.5;
  double get getTempMax => temp_max - 272.5;
  double get getTempMin => temp_min - 272.5;

  Weather_module(
      this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min);

  factory Weather_module.fromjson(Map<String, dynamic> Json) {
    return Weather_module(
      Json["temp"],
      Json["pressure"],
      Json["humidity"],
      Json["temp_max"],
      Json["temp_min"],
    );
  }
}
