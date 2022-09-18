import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/services/location/contracts/location_service.dart';
import 'package:myflutterapp/services/weather/contracts/temperature_converter_service.dart';
import 'package:myflutterapp/services/weather/contracts/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@Injectable()
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;
  final TemperatureConverterService temperatureConverterService;
  final LocationService locationService;
  WeatherBloc(this.weatherService, this.temperatureConverterService, this.locationService) : super(WeatherInitial()) {
    on<LoadWeather>(_onLoadWeather);
  }

  Future<void> _onLoadWeather(LoadWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    try{
      var locationDto = await locationService.getLocationByCityName(event.location);
      var weatherDto = await weatherService.getWeather(locationDto.latitude, locationDto.longtitute);
      var weatherState = WeatherLoaded(
        temperature: temperatureConverterService.fromKelvinsToCelsius(weatherDto.temp)
      );
      
      emit(weatherState);
    }
    catch(e) {
      emit(WeatherException());
    }
  }
}
