import 'package:json_annotation/json_annotation.dart';
part 'openweather_weather_dto.g.dart';

@JsonSerializable()
class OpenWeatherWeatherDto {
  //In kelvins
  final double temp;

  OpenWeatherWeatherDto({required this.temp});

  factory OpenWeatherWeatherDto.fromJson(Map<String, dynamic> json) => _$OpenWeatherWeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherWeatherDtoToJson(this);
}