import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:weather_app/_variables.dart';
import 'package:weather_app/controller/api_services.dart';
import 'package:weather_app/controller/get_location.dart';
import 'package:weather_app/view/Widgets/widget_search_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  loc.Location location = loc.Location();
  ApiServices apiServices = ApiServices();
  TextEditingController cityController = TextEditingController();
  String country = "";
  String letPermission = '';
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bk.jpg'), fit: BoxFit.cover)),
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
                          hintText: 'گەڕان بۆ شارەکان',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: 'nrt'),
                          prefixIcon: InkWell(
                            child: const Icon(Icons.search),
                            onTap: () async {
                              final response = await apiServices
                                  .getJsons(cityController.text);
                              setState(() {
                                Vars.post = response;
                              });
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
                            primary: Colors.white,
                          ),
                          onPressed: () async {
                            isOn = await location.serviceEnabled();
                            if (!isOn) {
                              location.requestService();
                              setState(() {
                                letPermission =
                                    'لۆکەیشن کارا بکە بۆ ئەوەی بتوانین شوێنت دیاری بکەین';
                              });
                            } else {
                              await GetLocation().determinePosition();

                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                      GetLocation.lat, GetLocation.lon);

                              ApiServices apiServices = ApiServices();
                              final response = await apiServices
                                  .getJsons('${placemarks[0].locality}');
                              setState(() {
                                country = placemarks[0].locality!;
                              });

                              Vars.post = response;
                              Vars.history = InfWidget(
                                temperature: Vars.istempratureTypeC == true
                                    ? '${Vars.post?.current.tempC} C°'
                                    : '${Vars.post?.current.tempF} F°',
                                locationName: '${Vars.post?.location.name}',
                                localTime: '${Vars.post?.location.localtime}',
                                image: '${Vars.post?.current.condition.icon}',
                              );
                            }
                          },
                          child: country == ''
                              ? const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                )
                              : Text(
                                  country,
                                  style: const TextStyle(color: Colors.black),
                                )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20, top: 6),
                      child: const Text(
                        'شوێنم دیاریی بکەن',
                        style: TextStyle(fontFamily: 'nrt'),
                      ),
                    ),
                  ],
                ),
                if (!isOn)
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Text(
                      letPermission,
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ),
                if (Vars.post != null)
                  SizedBox(
                      height: size.height * 0.6,
                      child: InfWidget(
                        temperature: Vars.istempratureTypeC == true
                            ? '${Vars.post?.current.tempC} C°'
                            : '${Vars.post?.current.tempF} F°',
                        locationName: '${Vars.post?.location.name}',
                        localTime:
                            '${Vars.post?.location.localtime.split(' ')[1]}\n${Vars.post?.location.localtime.split(' ')[0]}',
                        image: 'http:${Vars.post?.current.condition.icon}',
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
