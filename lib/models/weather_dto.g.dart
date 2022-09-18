// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather/weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };
