part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherException extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final double temperature;
  WeatherLoaded({required this.temperature});
}