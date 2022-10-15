import 'dart:convert';
import 'dart:io';
import 'package:weather_app/model/weekend_weather.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiServices {
  String apiKey = "902833916c454c328aa105039221706";
  Future<WeekendWeather> getWeather(String cityName) async {
    Dio dio = Dio();
    WeekendWeather? weekendWeather;

    final url =
        "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=yes&alerts=no";

    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions = buildCacheOptions(const Duration(days: 2));
    dio.interceptors.add(dioCacheManager.interceptor);

    try {
      final res = await dio.get(url, options: myOptions);
      weekendWeather = WeekendWeather.fromJson(jsonEncode(res.data));
    } on SocketException catch (e) {
      return Future.error("Network Errorr: $e");
    } catch (e) {
      return Future.error('error');
    }
    return weekendWeather;
  }
}
