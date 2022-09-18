import 'package:myflutterapp/models/location/location_dto.dart';

abstract class LocationService {
  Future<LocationDto> getLocationByCityName(String cityname);
}