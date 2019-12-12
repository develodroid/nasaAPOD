import 'package:flutter/material.dart';
import 'package:nasa_apod/apod_home_page.dart';

void main() => runApp(NasaAPOD());

class NasaAPOD extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa APOD',
      theme: ThemeData(
        backgroundColor: Colors.indigo[900],
        primarySwatch: Colors.purpleAccent[900],
      ),
      home: APODHomePage()
    );
  }
}


