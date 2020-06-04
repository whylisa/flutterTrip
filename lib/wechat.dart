import 'package:flutter/material.dart';

class Wechat extends StatefulWidget {
  @override
  _WechatState createState() => _WechatState();
}

class _WechatState extends State<Wechat> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('掘贝'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffedeef0),
            Color(0xffe6e7e9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('商机',Icons.folder,0),
          _bottomItem('CRM',Icons.explore,1),
          _bottomItem('消息',Icons.donut_small,2),
          _bottomItem('我',Icons.person,3),
        ]
      )
    );
  }
  _bottomItem(String title,IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
      title: Text(title, style: TextStyle(color:_currentIndex!=index?_defaultColor:_activeColor))

    );
  }
}