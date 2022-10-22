import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/constants/channels.dart';
import 'package:myflutterapp/models/battery/battery_dto.dart';
import 'contracts/battery_service.dart';

@Injectable(as: BatteryService)
class BatteryServiceImpl implements BatteryService {
  static const platform = MethodChannel(ChannelsConstants.batteryChannel);

  @override
  Future<BatteryDto> getBatteryInfo() async {
    final res = await platform.invokeMethod<int>(ChannelsConstants.batteryChannelGet);
    return BatteryDto(energyLevel: res!);
  }
}