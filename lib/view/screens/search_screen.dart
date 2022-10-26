import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search_provider.dart';
import 'package:weather_app/view/Widgets/autocomplete_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final varsProvider = context.read<Varses>();
    // Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 98, 8, 234),
            Color.fromARGB(255, 98, 8, 234),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Consumer<Varses>(
                      builder: (context, value, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: varsProvider.listOfHistory.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 172,
                                child: value
                                    .reverseMap(value.listOfHistory)
                                    .values
                                    .elementAt(index),
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomAutoComplete()),
            ],
          ),
        ),
      ),
    );
  }
}
