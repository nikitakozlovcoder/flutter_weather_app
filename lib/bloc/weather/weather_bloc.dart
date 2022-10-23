import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/weather/weather_dto.dart';
import 'package:myflutterapp/services/location/contracts/location_service.dart';
import 'package:myflutterapp/services/weather/contracts/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService;
  final LocationService _locationService;
  WeatherBloc(this._weatherService, this._locationService) : super(WeatherInitialState()) {
    on<LoadWeatherEvent>(_onLoadWeather);
  }

  Future<void> _onLoadWeather(LoadWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());

    try{
      var locationDto = await _locationService.getLocationByCityName(event.location);
      var weatherDto = await _weatherService.getWeather(locationDto.latitude, locationDto.longtitute);
      var weatherState = WeatherLoadedState(weather: weatherDto);
      emit(weatherState);
    }
    catch(e) {
      emit(WeatherExceptionState());
      log(e.toString());
    }
  }
}
