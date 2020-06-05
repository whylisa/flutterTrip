import 'package:flutter/material.dart';
import 'package:trip/pages/home_page.dart';
import 'package:trip/pages/my_page.dart';
import 'package:trip/pages/search_page.dart';
import 'package:trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor  = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: Text('商机',
                style: TextStyle(
                  color: _currentIndex != 0? _defaultColor:_activeColor,
                ),
              ),
              icon: Icon(
                Icons.monetization_on,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.monetization_on,
                color: _activeColor,
              )
          ),
          BottomNavigationBarItem(
              title: Text('CRM',
                style: TextStyle(
                  color: _currentIndex != 1? _defaultColor:_activeColor,
                ),
              ),
              icon: Icon(
                Icons.people,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.people,
                color: _activeColor,
              )
          ),
          BottomNavigationBarItem(
              title: Text('消息',
                style: TextStyle(
                  color: _currentIndex != 2? _defaultColor:_activeColor,
                ),
              ),
              icon: Icon(
                Icons.message,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.message,
                color: _activeColor,
              )
          ),
          BottomNavigationBarItem(
              title: Text('我',
                style: TextStyle(
                  color: _currentIndex != 3? _defaultColor:_activeColor,
                ),
              ),
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              )
          ),
        ],
      ),
    );
  }
}
