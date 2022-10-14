import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../weather_provider.dart';
import 'package:weather_app/model/weekend_weather.dart';

class ApiServices {
  String apiKey = "902833916c454c328aa105039221706";
  Future<WeekendWeather> getJsons(String cityName) async {
    final url =
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=${cityName.toLowerCase()}&aqi=no";

    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeekendWeather.fromJson(response.body);
    } else {
      throw Exception();
    }
  }

  Future<WeekendWeather> getWeekendWeather() async {
    WeekendWeather? weekendWeather;
    final url =
        "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=${localStorage.read('mainCountry')}&days=7&aqi=yes&alerts=no";

    try {
      final Response res = await get(Uri.parse(url));
      weekendWeather = WeekendWeather.fromJson(res.body);
      debugPrint(weekendWeather.toJson());
    } on SocketException catch (e) {
      return Future.error("Network Errorr: $e");
    } catch (e) {
      return Future.error(e);
    }

    return weekendWeather;
  }
}
