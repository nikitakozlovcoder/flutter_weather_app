// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:injectable_http_service/injectable_http_service.dart' as _i6;

import '../bloc/battery/battery_bloc.dart' as _i14;
import '../bloc/weather/weather_bloc.dart' as _i15;
import '../services/battery/battery_service_impl.dart' as _i4;
import '../services/battery/contracts/battery_service.dart' as _i3;
import '../services/http/openweather_http_service_impl.dart' as _i7;
import '../services/location/contracts/location_service.dart' as _i8;
import '../services/location/location_service_impl.dart' as _i9;
import '../services/weather/contracts/temperature_converter_service.dart'
    as _i10;
import '../services/weather/contracts/weather_service.dart' as _i12;
import '../services/weather/temperature_converter_service_impl.dart' as _i11;
import '../services/weather/weather_service_impl.dart' as _i13;
import 'env.dart' as _i5;
import 'register_module.dart' as _i16; // ignore_for_file: unnecessary_lambdas

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
  final registerModule = _$RegisterModule();
  gh.factory<_i3.BatteryService>(() => _i4.BatteryServiceImpl());
  gh.singleton<_i5.Env>(_i5.Env());
  gh.factory<_i6.HttpService<Map<String, dynamic>>>(
      () => registerModule.httpService);
  gh.factory<_i6.HttpService<Map<String, dynamic>>>(
    () => _i7.OpenWeatherHttpServiceImpl(get<_i5.Env>()),
    instanceName: 'OpenWeatherHttpServiceImpl',
  );
  gh.factory<_i8.LocationService>(() => _i9.LocationServiceImpl(
      get<_i6.HttpService<Map<String, dynamic>>>(
          instanceName: 'OpenWeatherHttpServiceImpl')));
  gh.factory<_i10.TemperatureConverterService>(
      () => _i11.TemperatureConverterServiceImpl());
  gh.factory<_i12.WeatherService>(() => _i13.WeatherServiceImp(
        get<_i10.TemperatureConverterService>(),
        get<_i6.HttpService<Map<String, dynamic>>>(
            instanceName: 'OpenWeatherHttpServiceImpl'),
      ));
  gh.factory<_i14.BatteryBloc>(
      () => _i14.BatteryBloc(get<_i3.BatteryService>()));
  gh.factory<_i15.WeatherBloc>(() => _i15.WeatherBloc(
        get<_i12.WeatherService>(),
        get<_i8.LocationService>(),
      ));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {
  @override
  _i6.JsonHttpServiceImpl get httpService => _i6.JsonHttpServiceImpl();
}
