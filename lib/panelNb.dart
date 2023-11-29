import 'package:flutter/material.dart';
import 'SolarPanelPage.dart';

class panelNb extends StatefulWidget {
  const panelNb({super.key});
  @override
  _panelNbState createState() => _panelNbState();
}

// ignore: unused_element
class _panelNbState extends State<panelNb> {
  String _text = '';

  double _watt = -1, _sun_hours = -1 , _wattPanel=-1;

  var child;

  void updateText() {

    setState(() {

      if (_watt == -1 || _sun_hours == -1 || _wattPanel==-1) {

        _text = 'Please fill all fields';

      }

      else {

        _text = (_watt / _sun_hours / _wattPanel).toString();

      }

    });

  }
  void updateWattHouse(String wattHouse) {

    if (_watt.toDouble() == '') {

      _watt = -1;

    }

    else {

      _watt = double.parse(wattHouse);

    }

  }
  void updateWattPanel(String wattPanel) {

    if (_wattPanel.toDouble() == '') {

      _wattPanel = -1;

    }

    else {

      _wattPanel= double.parse(wattPanel);

    }

  }

  void updateSunHours(String sunHours) {

    if (_sun_hours.toDouble() == '') {

      _sun_hours = -1;

    }

    else {

      _sun_hours = double.parse(sunHours);

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
        title: Text('number panel'),
    ),
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20.0),

        Text('number of panel: $_text', style: const TextStyle(fontSize: 18.0)),

        const SizedBox(height: 20.0),

        MyTextField(f: updateWattHouse, hint: 'Enter wattHouse'),

        const SizedBox(height: 20.0),

        MyTextField(f: updateWattPanel, hint: 'Enter WattPanel'),

        const SizedBox(height: 20.0),
        MyTextField(f: updateSunHours, hint: 'Enter sunHours'),

        const SizedBox(height: 20.0),

        ElevatedButton(onPressed: () {updateText();}, child: Text('number of panel', style: TextStyle(fontSize: 24.0),)
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