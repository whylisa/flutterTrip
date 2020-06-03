import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hh",
      home: Scaffold(
              appBar: AppBar(title: Text('ddd')),
              body: Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                       children: <Widget>[
                            Text(
                              'iam text',
                               style: TextStyle(
                                 fontSize: 28.0,
                                 color: Colors.red
                               )
                             ),
                            Icon(
                              Icons.android,
                              size: 50,
                              color: Colors.red
                            ),
                            CloseButton(),
                            BackButton(),
                            Chip(
                              avatar: Icon(Icons.people),
                              label: Text('Stateless的基组件')
                            ),
                            Divider(
                              height: 10,//容器高度，不是线的高度
                              indent: 10,// 左侧间距
                            ),
                            Card(
                             // 带有圆角，阴影，边框等效果的卡片
                             color: Colors.blue,
                             elevation: 5,
                             margin:EdgeInsets.all(10),
                             child: Container(
                               padding: EdgeInsets.all(10),
                               child: Text('sss')
                             )
                            ),
                            AlertDialog(
                              title: Text('jj'),
                              content: Text('funck')
                            )
                            ]
  

        )
      )
    )
    );
    
    
  }
}