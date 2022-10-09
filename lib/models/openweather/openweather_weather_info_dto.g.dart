// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openweather_weather_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherWeatherInfoDto _$OpenWeatherWeatherInfoDtoFromJson(
        Map<String, dynamic> json) =>
    OpenWeatherWeatherInfoDto(
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OpenWeatherWeatherInfoDtoToJson(
        OpenWeatherWeatherInfoDto instance) =>
    <String, dynamic>{
      'description': instance.description,
      'main': instance.main,
    };
