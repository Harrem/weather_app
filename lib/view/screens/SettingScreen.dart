import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/Variables.dart';
import 'package:weather_app/controller/apiServices.dart';
import 'package:weather_app/controller/getLocation.dart';
import 'package:weather_app/view/Widgets/InfWidget.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String country = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Temprature Type'),
                ToggleSwitch(
                  minWidth: 50,
                  minHeight: 30,
                  initialLabelIndex: 0,
                  cornerRadius: 5,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['C', 'F'],
                  borderWidth: 2.0,
                  activeBgColors: [
                    [Colors.blue],
                    [Colors.blue],
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      Vars.istempratureTypeC = true;
                    } else if (index == 1) {
                      Vars.istempratureTypeC = false;
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mode'),
                ToggleSwitch(
                  minWidth: 50,
                  minHeight: 30,
                  initialLabelIndex: 0,
                  cornerRadius: 5.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [Icons.light_mode_outlined, Icons.dark_mode_outlined],
                  iconSize: 30.0,
                  borderWidth: 3,
                  activeBgColors: [
                    [Colors.yellow, Colors.amber.shade600],
                    [Colors.grey, Colors.black]
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      Vars.istempratureTypeC = true;
                    } else if (index == 1) {
                      Vars.istempratureTypeC = false;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
