part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  Weather_module model;
  WeatherLoaded(this.model);
}

class WeatherNotFound extends WeatherState {}
