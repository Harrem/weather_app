import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/weekend_weather.dart';
import '../../providers/search_provider.dart';

class CustomAutoComplete extends StatefulWidget {
  CustomAutoComplete({Key? key}) : super(key: key);

  @override
  State<CustomAutoComplete> createState() => _CustomAutoCompleteState();
}

class _CustomAutoCompleteState extends State<CustomAutoComplete> {
  TextEditingController cityController = TextEditingController();
  bool indicator = false;
  bool showSuggestions = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final varsProvider = context.read<Varses>();

    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            color: const Color.fromARGB(255, 98, 8, 234),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Search for location',
                prefixIcon: const Icon(Icons.search),
                suffix: !indicator
                    ? null
                    : Container(
                        alignment: Alignment.center,
                        width: 17,
                        height: 17,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      ),
              ),
              onChanged: ((value) async {
                indicator = true;
                showSuggestions = true;
                WeekendWeather? response = await apiServices
                    .getWeather(cityController.text)
                    .onError((error, stackTrace) {
                  debugPrint("City not found");
                  return null;
                });
                setState(() {});
                if (response != null) {
                  varsProvider.weekendWeather = response;
                  varsProvider.addWidget(cityController.text);
                }
              }),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            FutureBuilder<List<String?>?>(
              future: getSuggestions(cityController.text),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  indicator = true;
                }
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty && showSuggestions) {
                    indicator = false;
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              cityController.text = snapshot.data![index]!;
                              setState(() {
                                showSuggestions = false;
                              });
                            },
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(10),
                              child: Text(snapshot.data![index] ?? ''),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return Text("");
                // snapshot.data == null
                //     ? const Text("")
                //     : snapshot.data!.isEmpty
                //         ? const Text("")
                //         : Container(
                //             padding: const EdgeInsets.all(20.0),
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(16),
                //             ),
                //             child: ListView.builder(
                //               shrinkWrap: true,
                //               itemCount: snapshot.data!.length,
                //               itemBuilder: (BuildContext context, int index) {
                //                 return Container(
                //                   padding: const EdgeInsets.all(10),
                //                   child: Text(snapshot.data![index] ?? ''),
                //                 );
                //               },
                //             ),
                //           );
              }),
            ),
            // const TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search for location',
            //     prefixIcon: Icon(Icons.search),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Future<List<String?>?> getSuggestions(String text) async {
    if (text.isEmpty) return [];
    var api = Uri.parse(
        // "https://api.geoapify.com/v1/geocode/autocomplete?text=$text&apiKey=f3ee33c7a16f48d3a3319135f201a4aa"
        "http://api.weatherapi.com/v1/search.json?key=902833916c454c328aa105039221706&q=$text");
    var res = await http.get(api);

    List<dynamic> json = jsonDecode(res.body);
    // debugPrint(json['features'][0]['properties']['name'].toString());
    List<String?>? suggestions;
    if (json.isNotEmpty) {
      suggestions = json.map((e) {
        if (e["name"] != null) {
          return e['name'] as String;
        }
      }).toList();
    }
    debugPrint(suggestions.toString());
    return suggestions?.sublist(0, 5);
  }
}
