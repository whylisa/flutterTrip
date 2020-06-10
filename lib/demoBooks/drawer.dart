import 'package:flutter/material.dart';

class Drawers  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('抽屉组件'
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('fuck'),
              accountEmail: Text('dfsff'),
            ),

          ],
        ),
      ),
    );
  }
}
