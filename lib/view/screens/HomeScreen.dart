import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          minHeight: 263,
          maxHeight: 600,
          color: Colors.deepPurple,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          panel: Column(
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
                      Text("Today", style: TextStyle(color: Colors.grey[100])),
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
          body: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(height: 30),
                const Icon(Icons.cloud_outlined, size: 150),
                const Text("Cloudy", style: TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Wind",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text("234", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            "Temp",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text("234", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text("234", style: TextStyle(fontSize: 18)),
                          Text('rgsr')
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
