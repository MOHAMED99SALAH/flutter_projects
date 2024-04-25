class Weather_module {
  final temp;
  final description;
  final temp_max;
  final temp_min;
  final humidity;
  final widspeed;
  final clouds;

  double get getTemp => temp - 272.5;

  dynamic get getHumidity => humidity;

  dynamic get getwidspeed => widspeed;

  dynamic get getClouds => clouds;

  String get getDescription => description;

  double get getTempMax => temp_max - 272.5;

  double get getTempMin => temp_min - 272.5;

  Weather_module(this.temp, this.description, this.temp_max, this.temp_min,
      this.humidity, this.widspeed, this.clouds);

  factory Weather_module.fromjson(Map<String, dynamic> Json) {
    return Weather_module(
      Json["main"]["temp"],
      Json["weather"][0]["main"],
      Json["main"]["temp_max"],
      Json["main"]["temp_min"],
      Json["main"]["humidity"],
      Json["wind"]["speed"],
      Json["clouds"]["all"],
    );
  }
}
