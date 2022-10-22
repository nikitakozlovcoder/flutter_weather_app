import 'package:myflutterapp/models/battery/battery_dto.dart';

abstract class BatteryService {
  Future<BatteryDto> getBatteryInfo();
}