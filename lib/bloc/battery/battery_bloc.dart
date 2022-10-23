import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/models/battery/battery_dto.dart';
import 'package:myflutterapp/services/battery/contracts/battery_service.dart';

part 'battery_event.dart';
part 'battery_state.dart';

@injectable
class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  final BatteryService _batteryService;

  BatteryBloc(this._batteryService) : super(BatteryInitialState()) {
    on<BatteryLoadEvent>(_onBatteryLoad);
  }

  FutureOr<void> _onBatteryLoad(BatteryLoadEvent event, Emitter<BatteryState> emit) async {

    try {
      final info = await _batteryService.getBatteryInfo();
      emit(BatteryLoadedState(battery: info));
    }
    catch(e) {
        emit(BatteryExceptionState());
    }
  }
}
