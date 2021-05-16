import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({Key key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Choose a Location'),
        backgroundColor: Colors.blue[900],
      ),
      body: Text('Locations Page'),
    );
  }
}
