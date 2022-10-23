import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myflutterapp/bloc/weather/weather_bloc.dart';
import 'package:myflutterapp/configuration/di.dart';
import 'package:myflutterapp/constants/ui.dart';
import 'package:myflutterapp/extensions/navigation/open.dart';
import 'package:myflutterapp/views/components/submittable_textfield.dart';
import 'package:myflutterapp/views/components/weather_show.dart';
import 'package:myflutterapp/views/screens/battery_info_screen.dart';

class WeatherScreen extends StatelessWidget {
  static const label = "City";
  final String title;

  const WeatherScreen({
    Key? key, 
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => getIt<WeatherBloc>(),
            child: Builder(builder: (context) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildColumn(context)
                );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    final weatherBloc = context.read<WeatherBloc>();
    final controller = TextEditingController();

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WeatherShow(),
            const SizedBox(height: appDefaultPadding * 6),
            SubmittableTextField(
              label: label,
              controller: controller,
              onSubmitted: _isDisabled(state) ? null : (val) => _onSearchWeather(val, weatherBloc)
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _isDisabled(state) ? null : () => _onSearchWeather(controller.text, weatherBloc),
                  child: const Text("Seach"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.open(const BatteryInfoScreen()), 
                child: const Text('Battery Info')
              ),
            )
          ],
        );
      },
    );
  }

  bool _isDisabled(WeatherState state) {
    return state is WeatherLoadingState;
  }

  void _onSearchWeather(String location, WeatherBloc weatherBloc){
    weatherBloc.add(LoadWeatherEvent(location: location));
  }
}
