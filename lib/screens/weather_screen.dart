import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myflutterapp/constants/ui.dart';

import '../bloc/weather/weather_bloc.dart';
import '../components/submittable_textfield.dart';
import '../components/weather_show.dart';

class WeatherScreen extends StatelessWidget {
  static const label = "City";

  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => WeatherBloc(),
          child: Builder(builder: (context) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildColumn(context)
              );
          }),
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
              onSubmitted: _isDisabled(state) ? null : (val) => weatherBloc.add(LoadWeather(location: val)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _isDisabled(state) ? null : () => weatherBloc.add(LoadWeather(location: controller.text)),
                  child: const Text("Seach"),
                ),
            )
          ],
        );
      },
    );
  }

  bool _isDisabled(WeatherState state) {
    return state is WeatherLoading;
  }
}
