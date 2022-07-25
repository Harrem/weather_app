import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          minHeight: 200,
          panel: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.link_rounded),
                const Text("Slide Up"),
                FractionallySizedBox(
                  widthFactor: 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Today", style: TextStyle(color: Colors.grey)),
                      Text(""),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 0.82,
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 100,
                              width: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: BorderSide.none,
                                ),
                                child: Expanded(
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
                            ),
                          )),
                    ),
                  ),
                ),
                Divider(),
                FractionallySizedBox(
                    widthFactor: 0.8,
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
          borderRadius: BorderRadius.circular(30),
          body: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_outlined, size: 150),
                    Text("Cloudy", style: TextStyle(fontSize: 30)),
                    SizedBox(height: 30),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
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
                                "Temp",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
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
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text("234", style: TextStyle(fontSize: 18)),
                              ElevatedButton(
                                child: Text('rgsr'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen()));
                                },
                              )
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
