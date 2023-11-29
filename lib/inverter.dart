import 'package:flutter/material.dart';

class inverter extends StatefulWidget {
  @override
  _inverterState createState() => _inverterState();
}

class _inverterState extends State<inverter> {
  String _text = '';

  double _nbofPanel = -1, _sizeofpanel = -1;

  var child;

  void updateText() {

    setState(() {

      if (_nbofPanel == -1 || _sizeofpanel == -1) {

        _text = 'Please fill all fields';

      }

      else {

        _text = (_nbofPanel * _sizeofpanel).toString();

      }

    });

  }
  void updatenbOfPanel(String nbofpanel) {

    if (_nbofPanel.toDouble() == '') {

      _nbofPanel = -1;

    }

    else {

      _nbofPanel = double.parse(nbofpanel);

    }

  }

  void updateSizeofPanel(String sizeofpanel) {

    if (_sizeofpanel.toDouble() == '') {

      _sizeofpanel = -1;

    }

    else {

      _sizeofpanel = double.parse(sizeofpanel);

    }

  }


  // Add your solar power calculations logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('calculation watt for inverter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),

            Text('watt of inverter: $_text', style: const TextStyle(fontSize: 18.0)),

            const SizedBox(height: 20.0),

            MyTextField(f: updatenbOfPanel, hint: 'Enter nb of panel'),

            const SizedBox(height: 20.0),

            MyTextField(f: updateSizeofPanel, hint: 'Enter size of panel'),

            const SizedBox(height: 20.0),

            ElevatedButton(onPressed: () {updateText();}, child: Text('watt of inverter', style: TextStyle(fontSize: 24.0),)
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