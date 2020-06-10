import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trip/demoBooks/tabBar.dart';
import 'package:trip/navigator/tab_navigator.dart';

import 'demoBooks/drawer.dart';
 void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'jue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Drawers(),
      );
  }

}




// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<String> cityNames = ['北京','上海','上海','上海','上海','上海','上海','上海','naj',];
//   ScrollController _scrollController = ScrollController();
//   @override
//   void initState() {
//     _scrollController.addListener(() {
//       if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//        _loadData();
//       }
//     });
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('下拉刷新'),
//         ),
//         body: RefreshIndicator(
//           onRefresh: _handRefresh,
//           child: ListView(
//             controller: _scrollController,
//             children: _buildList(),
//           ),
//         ),
//       ),
//     );
//   }
//   _loadData() async {
//     await Future.delayed(Duration(milliseconds: 200));
//     setState(() {
//       List<String> list = List<String>.from(cityNames);
//       list.addAll(cityNames);
//       print(list);
//       cityNames = list;
//     });
//   }
//   Future<Null> _handRefresh() async {
//     await Future.delayed(Duration(seconds: 2));
//     setState(() {
//       cityNames = cityNames.reversed.toList();
//     });
//     return null;
//   }
//   List<Widget> _buildList() {
//     return cityNames.map((city) => _item(city)).toList();
//   }
//   Widget _item(String city) {
//     return Container(
//       height: 80,
//       margin: EdgeInsets.only(bottom: 5),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(color: Colors.red),
//       child: Text(
//         city,
//         style: TextStyle(color: Colors.blue),
//       ),
//
//     );
//   }
// }


