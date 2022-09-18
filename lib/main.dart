import 'package:flutter/material.dart';
import 'package:myflutterapp/views/screens/weather_screen.dart';
import 'package:myflutterapp/extensions/Navigation/open.dart';

import 'configuration/di.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Builder(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                child: const Text("Go"),
                onPressed: () => context.open(const WeatherScreen(title: 'Weather App')),
              ),
            ),
          );
        }
      )
    );
  }
}