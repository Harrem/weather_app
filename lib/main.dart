import 'package:flutter/material.dart';
import 'package:weather_app/theme/custom_theme.dart';
import 'package:weather_app/view/screens/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const PageState(),
    );
  }
}
