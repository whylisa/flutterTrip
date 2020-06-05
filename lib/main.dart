import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/navigator/tab_navigator.dart';
//import 'package:http/http.dart' as http;
 void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//      return MaterialApp(
//        title: 'jue',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: TabNavigator(),
//      );
//  }
//
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String countString = '';
  String localCount = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _incrementCounter,
              child: Text('Increment Count'),
            ),
            RaisedButton(
              onPressed: _getCount,
              child: Text('get Cout'),
            ),
            Text(
              countString,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              localCount,
              style: TextStyle(fontSize: 30),
            )

          ],
        )
      ),
    );
  }
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + ' +1';

    });
    int counter = (prefs.getInt('counter')??0)+1;
    await prefs.setInt("counter", counter);
  }
  _getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();

    });
  }
}


