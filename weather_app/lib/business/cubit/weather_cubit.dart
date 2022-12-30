import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/weather_module.dart';
import '../../data/repository/weatherRepo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final weatherRepo repo;

  WeatherCubit(this.repo) : super(WeatherInitial());

  void getTemp(String city) {
    repo.getTempereture(city).then((data) {
      if (data == 1) {
        emit(WeatherNotFound());
      }
      emit(WeatherLoaded(data));
    });
  }
}
