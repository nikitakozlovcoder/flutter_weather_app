import 'package:json_annotation/json_annotation.dart';

part 'location_responce.g.dart';

@JsonSerializable()
class LocationResponce {
  final String name;
  final String country;
  final double lat;
  final double lon;

  LocationResponce({required this.name, required this.country, required this.lat, required this.lon});
  factory LocationResponce.fromJson(Map<String, dynamic> json) => _$LocationResponceFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponceToJson(this);
}