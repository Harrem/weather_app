import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controller/api_services.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/weekend_weather.dart';

import '../../controller/date_time_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Post? post;
  WeekendWeather? weekendWeather;
  List<Forecastday>? forecastday;
  int hour = DateTime.now().hour;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    post = await ApiServices().getCurrentWeather();
    weekendWeather = await ApiServices().getWeekendWeather();
    if (weekendWeather != null) {
      forecastday = weekendWeather?.forecast?.forecastday;
    }
    debugPrint(DateTime.now().hour.toString());
    debugPrint(
        DateTime.fromMillisecondsSinceEpoch(forecastday![2].hour![7].timeEpoch!)
            .toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 235, 241, 255),
                Color.fromARGB(255, 250, 250, 255),
              ],
            ),
          ),
          child: SlidingUpPanel(
            minHeight: 263,
            maxHeight: 600,
            color: Colors.transparent,
            boxShadow: const [],
            panel: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  const FractionallySizedBox(
                    widthFactor: 0.90,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.linear_scale_sharp,
                        color: Color.fromARGB(255, 107, 38, 240),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Today",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                        Text(
                          "Next 7 Days",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              width: 70,
                              child: Card(
                                color: const Color.fromARGB(255, 107, 38, 240),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide.none,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/weather_icon_set/${forecastday != null ? forecastday![0].hour![index].condition!.text!.toLowerCase() : "sunny"}"
                                      ".svg",
                                      width: 40,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      forecastday != null
                                          ? forecastday![0]
                                              .hour![index]
                                              .time!
                                              .split(" ")[1]
                                          : "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      forecastday != null
                                          ? "${forecastday![0].hour![index].tempC!.round()}°C"
                                          : '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              forecastday != null ? forecastday!.length : 1,
                          itemBuilder: ((context, index) => SizedBox(
                                child: SizedBox(
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: const Color.fromARGB(
                                          255, 107, 38, 240),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              Icons.cloud,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            forecastday != null
                                                ? DateFormat('EEEE').format(
                                                    DateTime.parse(
                                                        forecastday![index]
                                                            .hour![12]
                                                            .time!))
                                                : "Mondy",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                ),
                              )),
                        )),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Today, ${DateTimeFormatter.formatDate(DateTime.now().toIso8601String())}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FutureBuilder<Post?>(
                              future: ApiServices().getCurrentWeather(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }
                                if (snapshot.data == null) {
                                  return const Text(
                                      "error while fetching data");
                                }
                                post = snapshot.data!;
                                return Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        post!.location.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 40,
                                            spreadRadius: 40,
                                            color:
                                                Color.fromARGB(19, 88, 70, 101),
                                          ),
                                        ],
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/weather_icon_set/${post!.current.condition.text.trim().toLowerCase()}.svg",
                                        width: 170,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    GradientText(
                                      post!.current.condition.text,
                                      style: const TextStyle(fontSize: 40),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 155, 160, 200),
                                            Color.fromARGB(255, 202, 209, 227),
                                          ]),
                                    ),
                                    const SizedBox(height: 30),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              const Text(
                                                "Wind",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                  post != null
                                                      ? post!.current.windKph
                                                          .round()
                                                          .toString()
                                                      : "N/A",
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 0.5,
                                            indent: 10,
                                          ),
                                          Column(
                                            children: [
                                              const Text(
                                                "Temp",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                post != null
                                                    ? "${post!.current.tempC.round()}°C"
                                                    : "N/A",
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 0.5,
                                          ),
                                          Column(
                                            children: [
                                              const Text(
                                                "Humidity",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                post != null
                                                    ? "${post!.current.humidity.round()}%"
                                                    : "N/A",
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })),
                        ]),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
