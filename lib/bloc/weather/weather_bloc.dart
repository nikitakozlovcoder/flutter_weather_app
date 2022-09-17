import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      emit(WeatherLoading());
      await Future.delayed(const Duration(seconds: 2));
      final rng = Random();
      final temperature = 10 + rng.nextInt(22) + Random().nextDouble();
      emit(WeatherLoaded(temperature: temperature));
    });
  }
}
