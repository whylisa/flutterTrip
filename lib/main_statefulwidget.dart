import 'package:flutter/material.dart';
void main() {
  runApp(StateFullGroup());
}
class StateFullGroup extends StatefulWidget{
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}
class _StateFullGroupState extends State<StateFullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20.0,color: Colors.red);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // title: 'statefulwidget',
      home: Scaffold( // 整个页面
        appBar: AppBar(
          title: Text('new state')
        ),
        bottomNavigationBar:BottomNavigationBar(
           currentIndex: _currentIndex,
           onTap: (index) {
             setState((){
               _currentIndex = index;
             });
           },
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.home,color: Colors.grey),
               activeIcon: Icon(Icons.home, color: Colors.blue),
               title: Text('首页')
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.list,color: Colors.grey),
               activeIcon: Icon(Icons.list, color: Colors.blue),
               title: Text('列表')
             )
        ]),
        floatingActionButton: FloatingActionButton( // 悬浮框
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex==0?RefreshIndicator(
          child: ListView(
            children: <Widget>[
              Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                       children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5,0,0,0),
                                hintText: '请输入',// 默认显示文字
                                hintStyle: TextStyle(fontSize: 20.0)
                              )
                            ),
                            Container(
                              height: 100.0,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('page1',Colors.deepPurple),
                                  _item('page1',Colors.blue),
                                  _item('page1',Colors.red),
                                ]
                              )
                            ),
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
      ),
            ]
          ),
          onRefresh: _handleRefresh,
      ):Text('fuck'),
    )
    );
  }
  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 12,color: Colors.red))
    );
  }
}