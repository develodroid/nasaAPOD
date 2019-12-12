import 'dart:ui';

import 'package:flutter/material.dart';

class APODFullPage extends StatelessWidget {
  final String imageUrl;

  APODFullPage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Hero(
        tag: imageUrl,
        child:  Stack(
          children: <Widget>[
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

class APODFullPageRoute extends MaterialPageRoute {
  APODFullPageRoute(String imageUrl)
      : super(
      builder: (context) => new APODFullPage(
        imageUrl: imageUrl,
      ));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}