import 'package:flutter/material.dart';
import 'package:nasa_apod/data/apod_item.dart';
import 'package:nasa_apod/network/nasa_apod_api.dart';
import 'package:nasa_apod/widget/apod_detail.dart';
import 'package:nasa_apod/apod_error_page.dart';
import 'package:nasa_apod/widget/apod_loader_animation.dart';

class APODHomePage extends StatelessWidget  {
  const APODHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.indigo[900],
        body: Center(
          child: FutureBuilder<APODItem>(
            future: NasaAPODApi().fetchAPOD(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return APODDetail(snapshot.data);
              } else if (snapshot.hasError) {
                print("${snapshot.error}");
                return APODErrorPage();
              }
              return APODLoaderAnimation(planet: "assets/planets/earth.png", error: false);
            },
          ),
        )
    );
  }
}