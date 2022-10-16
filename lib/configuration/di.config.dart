// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/weather/weather_bloc.dart' as _i12;
import '../services/http/contracts/http_service.dart' as _i4;
import '../services/http/http_service_impl.dart' as _i5;
import '../services/location/contracts/location_service.dart' as _i6;
import '../services/location/location_service_impl.dart' as _i7;
import '../services/weather/contracts/temperature_converter_service.dart'
    as _i8;
import '../services/weather/contracts/weather_service.dart' as _i10;
import '../services/weather/temperature_converter_service_impl.dart' as _i9;
import '../services/weather/weather_service_impl.dart' as _i11;
import 'env.dart' as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.Env>(() => _i3.Env());
  gh.factory<_i4.HttpService>(() => _i5.HttpServiceImpl());
  gh.factory<_i6.LocationService>(() => _i7.LocationServiceImpl(
        get<_i3.Env>(),
        get<_i4.HttpService>(),
      ));
  gh.factory<_i8.TemperatureConverterService>(
      () => _i9.TemperatureConverterServiceImpl());
  gh.factory<_i10.WeatherService>(() => _i11.WeatherServiceImp(
        get<_i3.Env>(),
        get<_i8.TemperatureConverterService>(),
        get<_i4.HttpService>(),
      ));
  gh.factory<_i12.WeatherBloc>(() => _i12.WeatherBloc(
        get<_i10.WeatherService>(),
        get<_i6.LocationService>(),
      ));
  return get;
}
