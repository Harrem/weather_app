import 'package:flutter/material.dart';
import 'package:weather_app/controller/api_services.dart';
import 'package:weather_app/model/weekend_weather.dart';

class WeekendWeatherProvider extends ChangeNotifier {
  late WeekendWeather weekendWeather;
  late List<Forecastday> forecastdays;
  ApiServices weatherApi = ApiServices();

  WeekendWeatherProvider() {
    getWeekendWeather();
  }

  Future<void> getWeekendWeather() async {
    weekendWeather = await weatherApi.getWeekendWeather();
  }
}
