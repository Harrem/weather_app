import 'package:flutter/material.dart';

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
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$locationName'),
            Text(
              temperature,
              style: TextStyle(fontSize: 20),
            ),
            Image.network(image),
            Center(
              child: Text(
                '$localTime',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }
}
