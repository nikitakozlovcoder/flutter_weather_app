part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeather extends WeatherEvent {
  final String location;
  LoadWeather({required this.location});
}
