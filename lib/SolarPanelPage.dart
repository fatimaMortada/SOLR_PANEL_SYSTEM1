import 'package:flutter/material.dart';

class SolarPanelPage extends StatefulWidget {
  @override
  _SolarPageState createState() => _SolarPageState();
}

class _SolarPageState extends State<SolarPanelPage> {
  String _text = '';

  double _voltage = -1, _ampere = -1;

  var child;

  void updateText() {

    setState(() {

      if (_voltage == -1 || _ampere == -1) {

        _text = 'Please fill all fields';

      }

      else {

        _text = (_voltage * _ampere*24).toString();

      }

    });

  }
  void updateVoltage(String voltage) {

    if (_voltage.toDouble() == '') {

      _voltage = -1;

    }

    else {

      _voltage = double.parse(voltage);

    }

  }

  void updateAmpere(String ampere) {

    if (_ampere.toDouble() == '') {

      _ampere = -1;

    }

    else {

      _ampere = double.parse(ampere);

    }

  }


  // Add your solar power calculations logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('calculation watt/day'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),

          Text('Watt/day: $_text', style: const TextStyle(fontSize: 18.0)),

          const SizedBox(height: 20.0),

          MyTextField(f: updateVoltage, hint: 'Enter voltage'),

          const SizedBox(height: 20.0),

          MyTextField(f: updateAmpere, hint: 'Enter ampere'),

          const SizedBox(height: 20.0),

          ElevatedButton(onPressed: () {updateText();}, child: Text('Watt/day', style: TextStyle(fontSize: 24.0),)
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