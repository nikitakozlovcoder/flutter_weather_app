part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading implements WeatherState {}

class WeatherException implements WeatherState {}

class WeatherLoaded implements WeatherState {
  final WeatherDto weather;
  WeatherLoaded({required this.weather});
}