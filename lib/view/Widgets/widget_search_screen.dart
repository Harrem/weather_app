import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';

class InfWidget extends StatelessWidget {
  const InfWidget(
      {Key? key,
      required this.temperature,
      required this.locationName,
      required this.localTime,
      required this.image})
      : super(key: key);

  final double temperature;
  final String locationName;
  final String localTime;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shadowColor: Colors.black,
        color: const Color.fromARGB(255, 98, 8, 234),
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              locationName,
              style: const TextStyle(color: Colors.white),
            ),
            localStorage.read('tempratureType') == false
                ? Text(
                    '$temperature C°',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                : Text('${((temperature * 1.8) + 32).toStringAsFixed(1)} F°',
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
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
                    onPressed: () {
                      context.read<Varses>().setMainCountry(locationName);
                      context.read<Varses>().navigations(0);
                    },
                    child: const Text(
                      'add',
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
                    onPressed: () {
                      context.read<Varses>().deleteCountry(locationName);
                    },
                    child: const Text(
                      'Remove',
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
