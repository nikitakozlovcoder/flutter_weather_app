import 'package:json_annotation/json_annotation.dart';
part 'openweather_responce.g.dart';

@JsonSerializable()
class OpenWeatherResponce<TData> {
  final Map<String, dynamic> main;
  final List<dynamic> weather;

  OpenWeatherResponce({required this.main, required this.weather});

  factory OpenWeatherResponce.fromJson(Map<String, dynamic> json) => _$OpenWeatherResponceFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherResponceToJson(this);
}