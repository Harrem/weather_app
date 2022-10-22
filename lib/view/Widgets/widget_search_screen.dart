import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/providers/search_provider.dart';

class InfWidget extends StatelessWidget {
  const InfWidget(
      {Key? key,
      required this.temperature,
      required this.locationName,
      required this.localTime,
      required this.image,
      required this.wind})
      : super(key: key);

  final double temperature;
  final double wind;
  final String locationName;
  final String localTime;
  final String image;
  @override
  Widget build(BuildContext context) {
    TextStyle subHeading =
        TextStyle(color: Colors.deepPurple[100], fontSize: 12);
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: const Color.fromARGB(255, 107, 38, 238),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: subHeading,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      locationName,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Temp", style: subHeading),
                          localStorage.read('tempratureType') == true
                              ? Text(
                                  '${temperature.round()} C°',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '${((temperature * 1.8) + 32).round()} F°',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wind", style: subHeading),
                          Text(
                            wind.round().toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wind", style: subHeading),
                          Text(
                            wind.round().toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    image,
                    width: 90,
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SizedBox(
              //       width: 100,
              //       child: TextButton(
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.white)),
              //         onPressed: () {
              //           context.read<Varses>().setMainCountry(locationName);
              //           context.read<Varses>().navigations(0);
              //         },
              //         child: const Text(
              //           'add',
              //           style: TextStyle(
              //             color: Color.fromARGB(255, 98, 8, 234),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 100,
              //       child: TextButton(
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.white)),
              //         onPressed: () {
              //           context.read<Varses>().deleteCountry(locationName);
              //         },
              //         child: const Text(
              //           'Remove',
              //           style: TextStyle(
              //             color: Color.fromARGB(255, 98, 8, 234),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ));
  }
}
