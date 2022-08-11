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
  String? hour;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    debugPrint(DateTime.now().hour.toString());
    super.initState();
  }

  void getData() async {
    post = await ApiServices().getCurrentWeather();
    setState(() {
      DateTime.now().hour.toString() ==
              post!.current.lastUpdated.split(":")[0].split(" ")[1]
          ? "hello"
          : "fds";
    });
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            panel: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Today",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Next 7 Days",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              height: 10,
                              width: 80,
                              child: Card(
                                color: const Color.fromARGB(255, 107, 38, 240),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide.none,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.cloud,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      hour ?? "nothig",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "30",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: ((context, index) => SizedBox(
                                child: SizedBox(
                                  // height: 50,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: const Color.fromARGB(
                                          255, 107, 38, 240),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              Icons.cloud,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Mondy",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 60,
                                            color: Color.fromARGB(20, 0, 0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        "http:${post!.current.condition.icon}",
                                        width: 200,
                                      ),
                                    ),
                                    GradientText(post!.current.condition.text,
                                        gradient: const LinearGradient(
                                          // tileMode: TileMode.clamp,
                                          colors: <Color>[
                                            Color.fromARGB(255, 160, 170, 204),
                                            Color.fromARGB(255, 232, 234, 247),
                                            //add more color here.
                                          ],
                                        )),
                                    Text(
                                      post!.current.condition.text,
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..shader = const LinearGradient(
                                            // tileMode: TileMode.clamp,
                                            colors: <Color>[
                                              Color.fromARGB(
                                                  255, 160, 170, 204),
                                              Color.fromARGB(
                                                  255, 232, 234, 247),
                                              //add more color here.
                                            ],
                                          ).createShader(
                                            Rect.fromCenter(
                                                center: Offset(10, 10),
                                                width: 10,
                                                height: 100),
                                          ),
                                      ),
                                    ),
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

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
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
