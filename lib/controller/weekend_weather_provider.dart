import 'package:flutter/material.dart';
import '../model/weekend_weather.dart';
import 'api_services.dart';

class WeekendWeatherProvider extends ChangeNotifier {
  late WeekendWeather weekendWeather;
  ApiServices weatherApi = ApiServices();

  Future<WeekendWeather> getWeekendWeather() async {
    weekendWeather = await weatherApi.getWeekendWeather();
    // .onError((error, stackTrace) => Future.error(error.toString()));
    return weekendWeather;
  }
}
