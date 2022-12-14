import 'package:injectable/injectable.dart';
import 'contracts/temperature_converter_service.dart';

@Injectable(as: TemperatureConverterService)
class TemperatureConverterServiceImpl implements TemperatureConverterService {
  static const _absoluteZeroByKelvins = 273.15;

  @override
  double fromKelvinsToCelsius(double temperature) {
    return temperature - _absoluteZeroByKelvins;
  }
}