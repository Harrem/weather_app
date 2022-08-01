import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/view/screens/HomeScreen.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';
import 'package:weather_app/view/screens/SettingScreen.dart';

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  State<PageState> createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {
  int _selectedIndex = 0;
  List pageScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: pageScreens[_selectedIndex],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            width: 300,
            child: GNav(
                tabBackgroundColor: Color.fromARGB(255, 197, 131, 238),
                activeColor: Colors.white,
                padding: const EdgeInsets.all(12),
                duration: const Duration(milliseconds: 200),
                tabBorderRadius: 15,
                backgroundColor: Colors.transparent,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'سەرەکی',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'گەڕان',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'ڕێکخستنەکان',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ],
    ));
  }
}
