import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/openweather/openweather_responce.dart';
import 'package:myflutterapp/models/weather/weather_dto.dart';
import 'package:http/http.dart' as http;
import '../../configuration/env.dart';
import 'contracts/weather_service.dart';
import 'dart:convert';

@Injectable(as: WeatherService)
class WeatherServiceImp implements WeatherService {
  static const apiBase = "https://api.openweathermap.org/";
  static const weatherEndpoint = "data/2.5/weather";

  @override
  Future<WeatherDto> getWeather(double latitude, double longtitute) async {
    final url = "$apiBase$weatherEndpoint?lat=$latitude&lon=$longtitute&appid=${Env.openweathermapkey}";
    final responce = await http.get(Uri.parse(url));
    final map = jsonDecode(responce.body);
    final data = OpenWeatherResponce.fromJson(map);
    final weatherDto = WeatherDto.fromJson(data.main);

    return weatherDto;
  }

}