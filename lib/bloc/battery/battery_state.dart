part of 'battery_bloc.dart';

@immutable
abstract class BatteryState {}

class BatteryInitialState extends BatteryState {}

class BatteryExceptionState extends BatteryState {}

class BatteryLoadedState extends BatteryState {
  final BatteryDto battery;

  BatteryLoadedState({required this.battery});
}


