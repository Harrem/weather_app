import 'package:flutter/material.dart';
import 'package:weather_app/_variables.dart';

// ignore: must_be_immutable
class InfWidget extends StatelessWidget {
  InfWidget(
      {Key? key,
      required this.temperature,
      required this.locationName,
      required this.localTime,
      required this.image})
      : super(key: key);

  String temperature;
  String locationName;
  String localTime;
  String image;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shadowColor: Colors.black,
        color: Color.fromARGB(255, 98, 8, 234),
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              locationName,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              temperature,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(image),
            Center(
              child: Text(
                localTime,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        color: Color.fromARGB(255, 98, 8, 234),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: const Text(
                      'add',
                      style: TextStyle(
                        color: Color.fromARGB(255, 98, 8, 234),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
