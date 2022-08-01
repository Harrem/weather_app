import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controller/apiServices.dart';
import 'package:weather_app/model/currentWeather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Post? post;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() async {
    post = await ApiServices().getCurrentWeather();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Colors.white,
              ],
            ),
          ),
          child: SlidingUpPanel(
            minHeight: 263,
            maxHeight: 600,
            color: Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            panel: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple,
                    Color.fromARGB(255, 136, 97, 204),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  FractionallySizedBox(
                    widthFactor: 0.90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today",
                              style: TextStyle(color: Colors.grey[100])),
                          const Icon(
                            Icons.link_rounded,
                            color: Colors.white,
                          ),
                          Text("Today"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 150,
                              width: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide.none,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.cloud_outlined, size: 35),
                                    SizedBox(height: 5),
                                    Text(
                                      "11:00",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "30",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  Divider(),
                  FractionallySizedBox(
                      widthFactor: 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: ((context, index) => SizedBox(
                              child: Card(
                                  child: Row(
                                children: [
                                  Icon(Icons.cloud_outlined),
                                ],
                              )),
                            )),
                      ))
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
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Good",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w100),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Morning",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 30),
                          FutureBuilder<Post>(
                              future: ApiServices().getCurrentWeather(),
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.data == null) {
                                  return const Text(
                                      "error while fetching data");
                                }
                                post = snapshot.data!;
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 60,
                                              color:
                                                  Color.fromARGB(20, 0, 0, 0)),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/sun_sunrise.png",
                                        width: 200,
                                      ),
                                    ),
                                    Text(snapshot.data!.current.condition.text,
                                        style: const TextStyle(fontSize: 30)),
                                  ],
                                );
                              })),
                          const SizedBox(height: 30),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Wind",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                        post != null
                                            ? post!.current.windKph.toString()
                                            : "N/A",
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                                const VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Temp",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                        post != null
                                            ? post!.current.tempC.toString()
                                            : "N/A",
                                        style: const TextStyle(fontSize: 18)),
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
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                        post != null
                                            ? post!.current.humidity.toString()
                                            : "N/A",
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
