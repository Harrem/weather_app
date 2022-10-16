import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_services.dart';
import 'package:weather_app/controller/location_services.dart';
import 'package:weather_app/model/weekend_weather.dart';
import 'package:weather_app/providers/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    final varsProvider = context.read<Varses>();
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 98, 8, 234),
            Color.fromARGB(255, 98, 8, 234),
          ],
        )),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        hintText: 'Search for location',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: ((value) async {
                        WeekendWeather? response = await apiServices
                            .getWeather(cityController.text)
                            .onError((error, stackTrace) {
                          debugPrint("City not found");
                          return null;
                        });
                        if (response != null) {
                          varsProvider.weekendWeather = response;
                          varsProvider.addWidget(cityController.text);
                        }
                      }),
                    ),
                  ),
                ),
                Consumer<Varses>(
                  builder: (context, value, child) {
                    return SizedBox(
                      child: CarouselSlider.builder(
                        itemCount: varsProvider.listOfHistory.length,
                        itemBuilder: (context, i, realIndex) {
                          return SizedBox(
                            child: value
                                .reverseMap(value.listOfHistory)
                                .values
                                .elementAt(i),
                          );
                        },
                        options: CarouselOptions(
                          height: 170,
                          viewportFraction: 0.85,
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
