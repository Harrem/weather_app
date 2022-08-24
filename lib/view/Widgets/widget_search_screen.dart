import 'package:flutter/material.dart';

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
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(locationName),
            Text(
              temperature,
              style: const TextStyle(fontSize: 20),
            ),
            Image.network(image),
            Center(
              child: Text(
                localTime,
                style: const TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('add'),
            ),
          ],
        ));
  }
}
