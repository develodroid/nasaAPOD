import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/widget/apod_navigation_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class APODHomePage extends StatefulWidget {
  APODHomePage({Key key}) : super(key: key);

  @override
  _APODHomePageState createState() => _APODHomePageState();
}

class _APODHomePageState extends State<APODHomePage> {
  int selectedTab = 0;
  FlutterLocalNotificationsPlugin notificationsPlugin;

  @override
  Widget build(BuildContext context) {
    return APODNavigationController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    notificationsPlugin = configureLocalNotifications(context);

    (() async {
      await showDailyAtTime();
    })();
  }

  void onItemTapped(int tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => APODHomePage()),
    );
  }

  FlutterLocalNotificationsPlugin configureLocalNotifications(BuildContext context) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    return flutterLocalNotificationsPlugin;
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => APODHomePage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> showDailyAtTime() async {
    var time = Time(10, 13, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'NasaAPODDailyChannel',
        'Daily notifications for verification reminder',
        'Will Trigger every day');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await notificationsPlugin.showDailyAtTime(
        0,
        'New Nasa APOD',
        'Get the latest astronomy information',
        time,
        platformChannelSpecifics);
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await notificationsPlugin.show(
        0, 'New Nasa APOD', 'Get the latest astronomy information', platformChannelSpecifics,
        payload: 'item x');
  }
}