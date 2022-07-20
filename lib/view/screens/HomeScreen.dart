import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/ExploreScreen.dart';

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
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "London",
                    ),
                    Text("LondonEye"),
                  ],
                ),
              ),
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
                        ElevatedButton(
                          child: Text('rgsr'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExploreScreen()));
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
    );
  }
}
