// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openweather_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherWeatherDto _$OpenWeatherWeatherDtoFromJson(
        Map<String, dynamic> json) =>
    OpenWeatherWeatherDto(
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$OpenWeatherWeatherDtoToJson(
        OpenWeatherWeatherDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };
