import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search_provider.dart';

class PageState extends StatelessWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Consumer<Varses>(
              builder: (context, myType, child) {
                return Container(
                  child: myType.pageScreens[myType.screenHome],
                );
              },
            ),
            Consumer<Varses>(
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    width: 300,
                    child: GNav(
                        tabBackgroundColor:
                            const Color.fromARGB(255, 234, 234, 237),
                        activeColor: const Color.fromARGB(255, 100, 110, 150),
                        color: Colors.grey[700],
                        padding: const EdgeInsets.all(12),
                        duration: const Duration(milliseconds: 200),
                        tabBorderRadius: 15,
                        backgroundColor: Colors.transparent,
                        tabs: const [
                          GButton(
                            gap: 10,
                            icon: Iconsax.home,
                            text: 'Home',
                          ),
                          GButton(
                            gap: 10,
                            icon: Iconsax.search_normal4,
                            text: 'Search',
                          ),
                          GButton(
                            gap: 10,
                            icon: Iconsax.settings,
                            text: 'Settings',
                          ),
                        ],
                        selectedIndex: value.screenHome,
                        onTabChange: (index) {
                          value.navigations(index);
                        }),
                  ),
                );
              },
            )
          ],
        ));
  }
}
