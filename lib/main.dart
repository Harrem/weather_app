import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/HomeScreen.dart';
import 'package:weather_app/view/screens/MainPageState.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'nrt',
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: PageState(),
    );
  }
}
