import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../weather_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Temprature Type'),
                ToggleSwitch(
                  minWidth: 50,
                  minHeight: 30,
                  initialLabelIndex: localStorage.read('CorF') ?? 0,
                  cornerRadius: 5,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ['C', 'F'],
                  borderWidth: 2.0,
                  activeBgColors: const [
                    [Colors.blue],
                    [Colors.blue],
                  ],
                  onToggle: (index) async {
                    localStorage.write('CorF', index);
                    context.read<Varses>().changeTempratureType(index!);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
