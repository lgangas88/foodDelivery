import 'package:flutter/material.dart';
import 'package:tarsk_app/src/pages/auth/AuthBackground.dart';
import 'package:tarsk_app/src/pages/home/HomePage.dart';
import 'package:tarsk_app/src/pages/store/StorePage.dart';
import 'package:tarsk_app/src/pages/tracking-order/TrackingOrder.dart';
import 'package:tarsk_app/src/pages/user-location/UserLocationPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarsk',
      routes: {
        '/': (_) => AuthBackground(),
        '/home': (_) => HomePage(),
        '/store': (_) => StorePage(),
        '/user-location': (_) => UserLocationPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
