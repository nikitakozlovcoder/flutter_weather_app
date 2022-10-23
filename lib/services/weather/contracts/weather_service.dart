import 'package:myflutterapp/models/weather/weather_dto.dart';

abstract class WeatherService {
   Future<WeatherDto> getWeather(double latitude, double longtitute);
}