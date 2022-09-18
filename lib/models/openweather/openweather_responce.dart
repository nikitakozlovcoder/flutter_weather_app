import 'package:json_annotation/json_annotation.dart';
part 'openweather_responce.g.dart';

@JsonSerializable()
class OpenWeatherResponce<TData> {
  final Map<String, dynamic> main;

  OpenWeatherResponce({required this.main});

  factory OpenWeatherResponce.fromJson(Map<String, dynamic> json) => _$OpenWeatherResponceFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherResponceToJson(this);
}