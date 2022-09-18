import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/location/location_dto.dart';
import 'package:myflutterapp/models/location/location_responce.dart';
import 'package:myflutterapp/services/location/contracts/location_service.dart';
import 'package:http/http.dart' as http;
import '../../configuration/env.dart';

@Injectable(as: LocationService)
class LocationServiceImpl implements LocationService{
  static const apiBase = "https://api.openweathermap.org/";
  static const locationEndpoint = "geo/1.0/direct";

  @override
  Future<LocationDto> getLocationByCityName(String cityname) async {
    final url = "$apiBase$locationEndpoint?q=$cityname&appid=${Env.openweathermapkey}";
    final responce = await http.get(Uri.parse(url));
    final List<dynamic> list = jsonDecode(responce.body);
    final locationResponce = LocationResponce.fromJson(list.first);

    return LocationDto(
      longtitute: locationResponce.lon,
      latitude: locationResponce.lat
    );
  }
}