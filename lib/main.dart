import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/theme/custom_theme.dart';
import 'package:weather_app/view/screens/bottom_navbar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/providers/search_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Varses>(create: (context) => Varses()),
        ChangeNotifierProvider<WeekendWeatherProvider>(
            create: (context) => WeekendWeatherProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const PageState(),
      ),
    );
  }
}
