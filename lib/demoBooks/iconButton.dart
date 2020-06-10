/*
* iconButton 可交互的button
* Icons 框架自带的Icon集合
* IconTheme Iocn主题
* ImageIcon 通过AssetImage或者其他图片显示Icon
* Icon(Icons.phone, color: Color: Colors.green,size: 80.0)
* */
import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图标组件'),
      ),
      body: Column(
        children: <Widget>[
          Icon(
            Icons.people,
            color: Colors.grey,
            size: 10.0,
          ),
          IconButton(
            icon: Icon(
              Icons.volume_down,
              size: 10.0,
            ),
            tooltip: '按下操作',
            onPressed: (){
              print('press');
            },
          ),
          RaisedButton(
            child: Text('立体按钮'),
            onPressed: (){
              // 按下处理事件
            },
          )
        ],
      )
    );
  }
}


