// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/weather/weather_bloc.dart' as _i9;
import '../services/location/contracts/location_service.dart' as _i3;
import '../services/location/location_service_impl.dart' as _i4;
import '../services/weather/contracts/temperature_converter_service.dart'
    as _i5;
import '../services/weather/contracts/weather_service.dart' as _i7;
import '../services/weather/temperature_converter_service_impl.dart' as _i6;
import '../services/weather/weather_service_impl.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.LocationService>(() => _i4.LocationServiceImpl());
  gh.factory<_i5.TemperatureConverterService>(
      () => _i6.TemperatureConverterServiceImpl());
  gh.factory<_i7.WeatherService>(() => _i8.WeatherServiceImp());
  gh.factory<_i9.WeatherBloc>(() => _i9.WeatherBloc(
        get<_i7.WeatherService>(),
        get<_i5.TemperatureConverterService>(),
        get<_i3.LocationService>(),
      ));
  return get;
}
