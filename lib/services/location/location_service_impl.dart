import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/location/location_dto.dart';
import 'package:myflutterapp/models/location/location_responce.dart';
import 'package:myflutterapp/services/http/openweather_http_service_impl.dart';
import 'package:myflutterapp/services/http/contracts/http_service.dart';
import 'package:myflutterapp/services/location/contracts/location_service.dart';

@Injectable(as: LocationService)
class LocationServiceImpl implements LocationService{
  static const _apiBase = "https://api.openweathermap.org/";
  static const _locationEndpoint = "geo/1.0/direct";
  final HttpService _httpService;

  LocationServiceImpl(@Named.from(OpenWeatherHttpServiceImpl) this._httpService);
  
  @override
  Future<LocationDto> getLocationByCityName(String cityname) async {
    final url = "$_apiBase$_locationEndpoint?q=$cityname";
    final responce = await _httpService.getList<LocationResponce>(url, LocationResponce.fromJson);
    final locationResponce = responce.first;

    return LocationDto(
      longtitute: locationResponce.lon,
      latitude: locationResponce.lat
    );
  }
}