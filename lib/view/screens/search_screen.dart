import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_services.dart';
import 'package:weather_app/controller/location_services.dart';
import 'package:weather_app/providers/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    final varsProvider = context.read<Varses>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 250, 250, 255),
            Color.fromARGB(255, 236, 243, 255),
          ],
        )),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '21th July, 2022',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 17),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    width: size.width * 0.9,
                    height: 60,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: cityController,
                      textDirection: TextDirection.rtl,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 15, right: 10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          hintText: 'Search for location',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: 'nrt'),
                          prefixIcon: InkWell(
                            child: const Icon(Icons.search),
                            onTap: () async {
                              final response = await apiServices
                                  .getWeather(cityController.text);

                              varsProvider.weekendWeather = response;

                              varsProvider.addWidget(cityController.text);
                            },
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              isLocationOn = await location.serviceEnabled();
                              if (!isLocationOn) {
                                location.requestService();

                                varsProvider.locationPermission();
                              } else {
                                await GetLocation().determinePosition();

                                List<Placemark> placemarks =
                                    await placemarkFromCoordinates(
                                        GetLocation.lat, GetLocation.lon);

                                ApiServices apiServices = ApiServices();
                                varsProvider.weekendWeather = await apiServices
                                    .getWeather('${placemarks[0].locality}');

                                varsProvider
                                    .addWidget(placemarks[0].locality ?? '');
                              }
                            },
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ))),
                    Container(
                      padding: const EdgeInsets.only(right: 20, top: 6),
                      child: const Text(
                        'find my location',
                        style: TextStyle(fontFamily: 'nrt'),
                      ),
                    ),
                  ],
                ),
                if (!isLocationOn)
                  Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Consumer<Varses>(
                        builder: (context, value, child) {
                          return Text(
                            value.letPermission,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 11),
                          );
                        },
                      )),
                Consumer<Varses>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: size.height * 0.6,
                      child: CarouselSlider.builder(
                        itemCount: varsProvider.listOfHistory.length,
                        itemBuilder: (context, i, realIndex) {
                          return SizedBox(
                            width: size.width,
                            child: value
                                .reverseMap(value.listOfHistory)
                                .values
                                .elementAt(i),
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 0.85,
                          height: size.height * 0.6,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
