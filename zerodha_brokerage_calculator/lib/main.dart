import 'package:flutter/material.dart';
import 'package:zerodha_brokerage_calculator/screens/homeScreen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brokerage Calculator',
      home: HomeScreen(),
    );
  }
}
