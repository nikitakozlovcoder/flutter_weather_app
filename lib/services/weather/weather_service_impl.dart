import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/openweather/openweather_responce.dart';
import 'package:myflutterapp/models/openweather/openweather_weather_dto.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/models/openweather/openweather_weather_info_dto.dart';
import 'package:myflutterapp/models/weather/weather_dto.dart';
import '../../configuration/env.dart';
import 'contracts/weather_service.dart';
import 'dart:convert';

@Injectable(as: WeatherService)
class WeatherServiceImp implements WeatherService {
  static const apiBase = "https://api.openweathermap.org/";
  static const weatherEndpoint = "data/2.5/weather";
  final Env env;

  WeatherServiceImp(this.env);

  @override
  Future<WeatherDto> getWeather(double latitude, double longtitute) async {
    final url = "$apiBase$weatherEndpoint?lat=$latitude&lon=$longtitute&appid=${env.openweathermapkey}";
    final responce = await http.get(Uri.parse(url));
    final map = jsonDecode(responce.body);
    final data = OpenWeatherResponce.fromJson(map);
    final openWeatherWeatherDto = OpenWeatherWeatherDto.fromJson(data.main);
    final openWeatherWeatherWeatherInfoDto = OpenWeatherWeatherInfoDto.fromJson(data.weather.first);
    return WeatherDto(
      main: openWeatherWeatherWeatherInfoDto.main,
      description: openWeatherWeatherWeatherInfoDto.description,
      temp: openWeatherWeatherDto.temp
    );
  }

}