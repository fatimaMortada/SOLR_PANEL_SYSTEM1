import 'package:flutter/material.dart';
import 'fonction.dart';
import 'SolarPanelPage.dart';
import 'BatteryInverterPage.dart';
import 'SystemSolar.dart';
import 'panelNb.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,

        title: const Text('Solar Energy App'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Image.asset('assets/home.jpg',height: 200,width:200 ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  fonction()),
                );
              },
              child: const Text(' fonction of solar_panel'),

            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SystemSolar()),
                );
              },
              child: const Text(' Solar panel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SolarPanelPage()),
                );
              },
              child: const Text(' watt/day'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const panelNb()),
                );
              },
              child: const Text('panel'),
            ) ,
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BatteryInverterPage()),
                );
              },
              child: const Text('Batteries '),
            ),
          ]),
    );
  }
}
