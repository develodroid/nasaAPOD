import 'package:flutter/material.dart';
import 'package:nasa_apod/widget/apod_loader_animation.dart';

class APODWIPPage extends StatelessWidget {
  APODWIPPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: APODLoaderAnimation(planet: "assets/planets/destroyed.png", error: true),
          ),
          SizedBox(height: 42.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "Under development!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]
    );
  }
}

