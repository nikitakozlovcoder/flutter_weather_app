part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState implements WeatherState {}

class WeatherExceptionState implements WeatherState {}

class WeatherLoadedState implements WeatherState {
  final WeatherDto weather;
  WeatherLoadedState({required this.weather});
}