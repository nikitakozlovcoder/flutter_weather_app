// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openweather_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherResponce<TData> _$OpenWeatherResponceFromJson<TData>(
        Map<String, dynamic> json) =>
    OpenWeatherResponce<TData>(
      main: json['main'] as Map<String, dynamic>,
      weather: json['weather'] as List<dynamic>,
    );

Map<String, dynamic> _$OpenWeatherResponceToJson<TData>(
        OpenWeatherResponce<TData> instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
    };
