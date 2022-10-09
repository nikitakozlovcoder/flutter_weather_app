import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myflutterapp/bloc/weather/weather_bloc.dart';
import 'package:myflutterapp/extensions/strings/string.dart';

class WeatherShow extends StatelessWidget {
  const WeatherShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if(state is WeatherLoaded){
          return Column(
            children: [
              Text(state.weather.description.capitilize(), style: Theme.of(context).textTheme.headline5),
              Text("The temperature is ${state.weather.temp.toStringAsFixed(1)} °C",
                style: Theme.of(context).textTheme.headline5
              ),
            ],
          );
        }

        if(state is WeatherLoading){
          return const CircularProgressIndicator();
        }

        if(state is WeatherException){
          return Text(
            "An error occured, please try again later",
            style: Theme.of(context).textTheme.headline5?.apply(color: Colors.red),
          );
        }

        return Text(
          "Enter City name",
          style: Theme.of(context).textTheme.headline5
        );
      },
    );
  }
}
