import 'package:flutter/material.dart';
import '../model/weekend_weather.dart';
import 'search_provider.dart';
import '../controller/weather_services.dart';

class WeekendWeatherProvider extends ChangeNotifier {
  late WeekendWeather weekendWeather;
  ApiServices weatherApi = ApiServices();

  Future<WeekendWeather> getWeekendWeather() async {
    weekendWeather = await weatherApi
        .getWeather(localStorage.read('mainCountry') ?? "london");
    // .onError((error, stackTrace) => Future.error(error.toString()));
    return weekendWeather;
  }
}
