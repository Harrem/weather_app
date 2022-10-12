import 'package:flutter/material.dart';
import 'package:weather_app/controller/api_services.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart' as loc;
import 'package:weather_app/view/screens/home_screen.dart';
import 'package:weather_app/view/screens/search_screen.dart';
import 'package:weather_app/view/screens/setting_screen.dart';

import 'view/Widgets/widget_search_screen.dart';

final localStorage = GetStorage();
final loc.Location location = loc.Location();
final ApiServices apiServices = ApiServices();
bool isLocationOn = false;
String mainCountry = 'London';

class Varses extends ChangeNotifier {
  Post? post;
  String letPermission = '';
  int screenHome = 0;
  List pageScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingScreen()
  ];

  Map<String, Widget> listOfHistory = {};

  void navigations(int ine) {
    screenHome = ine;
    notifyListeners();
  }

  void changeTempratureType(int ind) {
    if (ind == 1) {
      localStorage.write('tempratureType', false);
    } else if (ind == 0) {
      localStorage.write('tempratureType', true);
    }
    notifyListeners();
  }

  void addWidget(String nameCity) {
    listOfHistory[nameCity.toLowerCase()] = InfWidget(
      temperature: post?.current.tempC.toDouble() ?? 0,
      locationName: '${post?.location.name}',
      localTime: '${post?.location.localtime}',
      image: 'http:${post?.current.condition.icon}',
    );
    notifyListeners();
  }

  void locationPermission() {
    letPermission = 'Turn on the location to get your place';
    notifyListeners();
  }

  void setMainCountry(String cityName) {
    mainCountry = cityName;
    localStorage.write('mainCountry', mainCountry);
  }

  void deleteCountry(String cityName) {
    listOfHistory.remove(cityName.toLowerCase());
    notifyListeners();
  }

  reverseMap(Map map) {
    Map newmap = {};
    for (String theKey in map.keys.toList().reversed) {
      newmap[theKey] = map[theKey];
    }
    return newmap;
  }
}
