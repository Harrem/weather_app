import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/controller/location_services.dart';

import '../../providers/search_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationProvider = context.read<Varses>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 98, 8, 234),
              Color.fromARGB(255, 98, 8, 234),
            ],
          ),
        ),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: const Text(
              "Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 98, 8, 234),
                  Color.fromARGB(255, 98, 8, 234),
                ],
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Temprature Type'),
                      ToggleSwitch(
                        minWidth: 50,
                        minHeight: 30,
                        initialLabelIndex: localStorage.read('CorF') ?? 1,
                        cornerRadius: 5,
                        inactiveBgColor: Colors.grey[200],
                        totalSwitches: 2,
                        labels: const ['F', 'C'],
                        borderWidth: 2.0,
                        activeBgColors: const [
                          [Color.fromARGB(255, 98, 8, 234)],
                          [Color.fromARGB(255, 98, 8, 234)],
                        ],
                        onToggle: (index) async {
                          localStorage.write('CorF', index);
                          context.read<Varses>().changeTempratureType(index!);
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'find my location',
                        style: TextStyle(fontFamily: 'nrt'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          isLocationOn = await location.serviceEnabled();
                          if (!isLocationOn) {
                            location.requestService();

                            LocationProvider.locationPermission();
                          } else {
                            await GetLocation().determinePosition();

                            List<Placemark> placemarks =
                                await placemarkFromCoordinates(
                                    GetLocation.lat, GetLocation.lon);

                            LocationProvider.weekendWeather = await apiServices
                                .getWeather('${placemarks[0].locality}');

                            LocationProvider.addWidget(
                                placemarks[0].locality ?? '');
                          }
                        },
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
