import 'package:flutter/material.dart';
import 'SolarPanelPage.dart';

class BatteryInverterPage extends StatefulWidget {
  const BatteryInverterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BatteryInverterPageState createState() => _BatteryInverterPageState();
}

class _BatteryInverterPageState extends State<BatteryInverterPage> {
  String _text = '';

  double _WattHouse = -1, _wattOfBattery = -1;

  var child;

  void updateText() {

    setState(() {

      if (_WattHouse == -1 || _wattOfBattery == -1) {

        _text = 'Please fill all fields';

      }

      else {

        _text = ((_WattHouse * 0.8)/_wattOfBattery).toString();

      }

    });

  }
  void updateWattHouse(String WattHouse) {

    if (_WattHouse.toDouble() == '') {

      _WattHouse = -1;

    }

    else {

      _WattHouse = double.parse(WattHouse);

    }

  }

  void updateBattery(String battery) {

    if (_wattOfBattery.toDouble() == '') {

      _wattOfBattery = -1;

    }

    else {

      _wattOfBattery = double.parse(battery);

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Batteries '),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20.0),

          Text('nb of battery: $_text', style: const TextStyle(fontSize: 18.0)),

          const SizedBox(height: 20.0),

          MyTextField(f: updateBattery, hint: 'Enter watt of battery'),

          const SizedBox(height: 20.0),

          MyTextField(f: updateWattHouse, hint: 'Enter watt of house/sun hours'),

          const SizedBox(height: 20.0),

          ElevatedButton(onPressed: () {updateText();}, child: Text('number of battery', style: TextStyle(fontSize: 24.0),)
          )


        ],
      ),
      ),
    );
  }
}
class MyTextField extends StatelessWidget {

  Function(String) f; // hold a variable function

  String hint; // holds the hintText of the TextField

  MyTextField({required this.hint, required this.f, super.key,});

  @override

  Widget build(BuildContext context) {

    return SizedBox(width: 300.0, height: 50.0,

      child: TextField(

        style: const TextStyle(fontSize: 18.0),

        decoration: InputDecoration(

            border: const OutlineInputBorder(), hintText: hint

        ),

        onChanged: (text) { f(text);}, // call the variable function

      ),

    );

  }


  }

