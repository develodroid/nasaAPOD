import 'package:flutter/material.dart';
import 'package:nasa_apod/widget/apod_loader_animation.dart';

class APODErrorPage extends StatefulWidget {
  @override
  _APODErrorPageState createState() => _APODErrorPageState();
}

class _APODErrorPageState extends State<APODErrorPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: APODLoaderAnimation(
                planet: "assets/planets/destroyed.png", error: true),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "Something went wrong, try again later",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ]
    );
  }
}


