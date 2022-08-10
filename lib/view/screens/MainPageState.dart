import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/view/screens/HomeScreen.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';
import 'package:weather_app/view/screens/SettingScreen.dart';
import 'package:flutter/cupertino.dart';

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
                tabBackgroundColor: Color.fromARGB(255, 240, 216, 255),
                activeColor: Colors.deepPurple[400],
                color: Colors.grey[700],
                padding: const EdgeInsets.all(12),
                duration: const Duration(milliseconds: 200),
                tabBorderRadius: 15,
                backgroundColor: Colors.transparent,
                tabs: const [
                  GButton(
                    gap: 10,
                    icon: CupertinoIcons.home,
                    text: 'سەرەکی',
                  ),
                  GButton(
                    gap: 10,
                    icon: CupertinoIcons.search,
                    text: 'گەڕان',
                  ),
                  GButton(
                    gap: 10,
                    icon: CupertinoIcons.settings,
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
