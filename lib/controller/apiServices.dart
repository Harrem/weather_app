import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/model/currentWeather.dart';

class ApiServices {
  String apiKey = "902833916c454c328aa105039221706";

  Future<Post> getJsons(String cityName) async {
    final url =
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no";

    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<Post?> getCurrentWeather() async {
    Post? forecast;
    final url =
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=London&days=7&aqi=yes&alerts=no";

    final Response res;
    try {
      res = await get(Uri.parse(url)).catchError((e) {
        debugPrint("an error occured: $e");
      });
      forecast = Post.fromJson(json.decode(res.body));
    } on SocketException catch (e) {
      debugPrint(e.toString());
    }

    return forecast;
  }
}
