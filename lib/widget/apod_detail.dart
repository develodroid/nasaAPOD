import 'package:flutter/material.dart';
import 'package:nasa_apod/data/apod_item.dart';
import 'package:nasa_apod/widget/apod_detail_body.dart';

class APODDetail extends StatelessWidget {
  APODDetail(this.apodItem);
  final APODItem  apodItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 42.0),
                  DetailBody(apodItem),
                ],
              ),
            ),
    );
  }
}