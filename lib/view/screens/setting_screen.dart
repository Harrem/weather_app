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
          Expanded(
            flex: 2,
            child: Container(
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
          ),
          Expanded(
            flex: 5,
            child: Container(
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
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
                            minWidth: 60,
                            minHeight: 45,
                            initialLabelIndex: localStorage.read('CorF') ?? 1,
                            cornerRadius: 15,
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
                              context
                                  .read<Varses>()
                                  .changeTempratureType(index!);
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
                            'Find My Location',
                            style: TextStyle(fontFamily: 'nrt'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 98, 8, 234),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10)),
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

                                LocationProvider.weekendWeather =
                                    await apiServices.getWeather(
                                        '${placemarks[0].locality}');

                                LocationProvider.addWidget(
                                    placemarks[0].locality ?? '');
                              }
                            },
                            child: const Icon(
                              Icons.location_on_outlined,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
