import 'package:flutter/material.dart';
import 'package:nasa_apod/apod_wip_page.dart';
import 'package:nasa_apod/apod_detail_page.dart';

class APODNavigationController extends StatefulWidget {
  @override
  _APODNavigationControllerState createState() =>
      _APODNavigationControllerState();
}

class _APODNavigationControllerState extends State<APODNavigationController> {
  final List<Widget> pages = [
    APODHomePage(
      key: PageStorageKey('APODHome'),
    ),
    APODWIPPage(
      key: PageStorageKey('APODWIP'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    backgroundColor: Colors.grey[200],
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.today), title: Text('Today')),
      BottomNavigationBarItem(
          icon: Icon(Icons.date_range), title: Text('Select')),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}