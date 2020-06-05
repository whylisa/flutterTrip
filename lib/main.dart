import 'package:flutter/material.dart';
import 'package:trip/navigator/tab_navigator.dart';
 void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'jue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TabNavigator(),
      );
  }

}