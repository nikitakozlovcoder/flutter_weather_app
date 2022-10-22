import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/openweather/openweather_responce.dart';
import 'package:myflutterapp/models/openweather/openweather_weather_dto.dart';
import 'package:myflutterapp/models/openweather/openweather_weather_info_dto.dart';
import 'package:myflutterapp/models/weather/weather_dto.dart';
import 'package:myflutterapp/services/http/contracts/http_service.dart';
import 'package:myflutterapp/services/http/openweather_http_service_impl.dart';
import 'contracts/temperature_converter_service.dart';
import 'contracts/weather_service.dart';

@Injectable(as: WeatherService)
class WeatherServiceImp implements WeatherService {
  static const apiBase = "https://api.openweathermap.org/";
  static const weatherEndpoint = "data/2.5/weather";
  final TemperatureConverterService temperatureConverterService;
  final HttpService httpService;

  WeatherServiceImp(this.temperatureConverterService, @Named.from(OpenWeatherHttpServiceImpl) this.httpService);

  @override
  Future<WeatherDto> getWeather(double latitude, double longtitute) async {
    final url = "$apiBase$weatherEndpoint?lat=$latitude&lon=$longtitute";
    final responce = await httpService.get<OpenWeatherResponce>(url, OpenWeatherResponce.fromJson);
    final openWeatherWeatherDto = OpenWeatherWeatherDto.fromJson(responce.main);
    final openWeatherWeatherInfoDto = OpenWeatherWeatherInfoDto.fromJson(responce.weather.first);

    return WeatherDto(
      main: openWeatherWeatherInfoDto.main,
      description: openWeatherWeatherInfoDto.description,
      temp: temperatureConverterService.fromKelvinsToCelsius(openWeatherWeatherDto.temp)
    );
  }
}