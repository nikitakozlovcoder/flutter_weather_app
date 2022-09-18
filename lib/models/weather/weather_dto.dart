import 'package:json_annotation/json_annotation.dart';
part '../weather_dto.g.dart';

@JsonSerializable()
class WeatherDto {
  //In kelvins
  final double temp;

  WeatherDto({required this.temp});

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}