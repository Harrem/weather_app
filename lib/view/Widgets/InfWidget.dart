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
        height: 110,
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      temperature,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.3,
                    color: Colors.white,
                  ),
                  Text('$locationName'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 100, bottom: 10, right: 100),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(14)),
                child: Center(
                  child: Text(
                    '$localTime',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
