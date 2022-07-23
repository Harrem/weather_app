import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/model/currentWeather.dart';

class ApiServices {
  String cityName = "Sayyid Sadiq";
  String apiKey = "902833916c454c328aa105039221706";

  Future<Post> getJsons() async {
    final url =
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no";
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }
}
