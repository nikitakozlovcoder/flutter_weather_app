// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponce _$LocationResponceFromJson(Map<String, dynamic> json) =>
    LocationResponce(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationResponceToJson(LocationResponce instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
