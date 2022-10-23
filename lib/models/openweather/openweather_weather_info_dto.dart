import 'package:json_annotation/json_annotation.dart';

part 'openweather_weather_info_dto.g.dart';

@JsonSerializable()
class OpenWeatherWeatherInfoDto {
  final String description;
  final String main;

  OpenWeatherWeatherInfoDto({required this.main, required this.description});

  factory OpenWeatherWeatherInfoDto.fromJson(Map<String, dynamic> json) => _$OpenWeatherWeatherInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherWeatherInfoDtoToJson(this);
}