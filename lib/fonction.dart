import 'package:flutter/material.dart';

class fonction extends StatefulWidget {
  @override
  _fonctionState createState() => _fonctionState();
}

class _fonctionState extends State<fonction> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('fonction of solar panel'),
        ),
        body: Center(child: Image.network('https://lirp.cdn-website.com/762beecb/dms3rep/multi/opt/how-solar-works-1-1920w-960w.png')),

    );}
}