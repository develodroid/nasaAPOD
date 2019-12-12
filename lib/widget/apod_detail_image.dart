import 'package:flutter/material.dart';
import 'package:nasa_apod/apod_full_page.dart';
import 'package:nasa_apod/data/apod_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailImage extends StatelessWidget {
  DetailImage(this.apodItem, this.radius);

  final APODItem apodItem;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if(apodItem.mediaType == "video") {
      return GestureDetector(
        onTap: () {
          _launchURL(apodItem.url);
        },
        child:
        Material(
          type: MaterialType.circle,
          elevation: 12.0,
          color: Colors.blue,
          child: Container(
              height: radius * 2,
              width: radius * 2,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.grey[300]),
              child: Center(
                child: Container(
                  child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        aPODImageClip(_extractVideoID(apodItem.url)),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                            BorderRadius.circular(radius),
                          ),
                        ),
                      ]
                  ),
                ),
              )),
        ),
      );
    } else {
      return Hero(
        tag: apodItem.url,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(APODFullPageRoute(apodItem.url));
          },
          child:
          Material(
            type: MaterialType.circle,
            elevation: 12.0,
            color: Colors.blue,
            child: Container(
                height: radius * 2,
                width: radius * 2,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: Colors.grey[300]),
                child: Center(
                  child: Container(
                    child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          aPODImageClip(apodItem.url),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(radius),
                            ),
                          ),
                        ]
                    ),
                  ),
                )),
          ),
        ),
      );
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String _extractVideoID(String url){
    print(url);
    var regExp =  new RegExp(
        r"(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})\W"
    );
    var match = regExp.stringMatch(url);
    match = match.replaceAll("youtube.com/embed/", "");
    match = match.replaceAll("?", "");
    return "https://img.youtube.com/vi/$match/default.jpg";
  }


  Widget aPODImageClip(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}

