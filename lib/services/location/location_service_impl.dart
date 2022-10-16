import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/location/location_dto.dart';
import 'package:myflutterapp/models/location/location_responce.dart';
import 'package:myflutterapp/services/http/contracts/http_service.dart';
import 'package:myflutterapp/services/location/contracts/location_service.dart';
import '../../configuration/env.dart';

@Injectable(as: LocationService)
class LocationServiceImpl implements LocationService{
  static const apiBase = "https://api.openweathermap.org/";
  static const locationEndpoint = "geo/1.0/direct";
  final HttpService httpService;
  final Env env;

  LocationServiceImpl(this.env, this.httpService);
  
  @override
  Future<LocationDto> getLocationByCityName(String cityname) async {
    final url = "$apiBase$locationEndpoint?q=$cityname&appid=${env.openweathermapkey}";
    final responce = await httpService.getList<LocationResponce>(url, LocationResponce.fromJson);
    final locationResponce = responce.first;

    return LocationDto(
      longtitute: locationResponce.lon,
      latitude: locationResponce.lat
    );
  }
}