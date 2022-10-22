part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final String location;
  LoadWeatherEvent({required this.location});
}
