import 'package:flutter/material.dart';
import 'package:nasa_apod/data/apod_item.dart';
import 'package:nasa_apod/widget/apod_detail_image.dart';

class DetailBody extends StatelessWidget {
  DetailBody(this.apodItem);
  final APODItem  apodItem;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Card(
            color: Colors.grey[200],
            child: Container(
              margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child:  Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 62.0),

                  Text(
                    apodItem.title,
                    style: textTheme.title.copyWith(fontSize: 22.0),
                  ),

                  SizedBox(height: 12.0),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      apodItem.explanation,
                      textAlign: TextAlign.justify,
                      style: textTheme.body2.copyWith(
                          color: Colors.black54,
                          fontSize: 18.0,
                          height: 1.5
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: DetailImage(apodItem, 64.0),
        ),
      ],
    );
  }
}