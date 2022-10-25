import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    padding: const EdgeInsets.symmetric(horizontal: 18),
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
                    return Container(
                      padding: const EdgeInsets.all(13),
                      height: MediaQuery.of(context).size.height / 1.32,
                      child: ListView.builder(
                        itemCount: varsProvider.listOfHistory.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 172,
                                child: value
                                    .reverseMap(value.listOfHistory)
                                    .values
                                    .elementAt(index),
                              ),
                              const Divider()
                            ],
                          );
                        },
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
