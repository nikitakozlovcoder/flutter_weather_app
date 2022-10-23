import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myflutterapp/bloc/battery/battery_bloc.dart';
import 'package:myflutterapp/configuration/di.dart';

class BatteryInfoScreen extends StatelessWidget {
  static const label = "City";
  static const title = "Battery Info";

  const BatteryInfoScreen({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => getIt<BatteryBloc>()..add(BatteryLoadEvent()),
            child: Builder(builder: (context) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildBatteryInfo(context)
                );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildBatteryInfo(BuildContext context) {
    return BlocBuilder<BatteryBloc, BatteryState>(
      builder: (context, state) {
        if(state is BatteryLoadedState) {
          return Text(
            '${state.battery.energyLevel}%', 
            style: Theme.of(context).textTheme.headline5
          );
        }
        else if (state is BatteryExceptionState) {
            return Text(
              'No info available', 
              style: Theme.of(context).textTheme.headline5?.apply(color: Colors.red)
            );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
