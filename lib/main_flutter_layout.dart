import 'package:flutter/material.dart';

class StateFullGroupLay extends StatefulWidget{
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}
class _StateFullGroupState extends State<StateFullGroupLay> {
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
          title: Text('new state'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
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
              Wrap( // 换行
              // 创建一个wrap布局，从左向右进行排列，会自动换行
              spacing: 8,
              runSpacing: 6,
              children: <Widget>[
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
              ]
              ),
              Stack( // 元素叠加
                children: <Widget>[
                  Image.network(
                    'https://res.weread.qq.com/wrepub/epub_27185001_79',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Positioned( // 类似绝对定位
                    left: 0,
                    bottom: 0,
                    child: Image.network(
                      'https://res.weread.qq.com/wrepub/epub_27185001_79',
                      width:36.0,
                      height: 36.0,
                      fit: BoxFit.fill,
                    )
                  )
                ]
              ),
              Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                       children: <Widget>[
                            Row(
                              children:<Widget> [
                                ClipOval(
                                  child:SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network('https://res.weread.qq.com/wrepub/epub_27185001_79',
                                     fit: BoxFit.fill
                                    ),
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.all(Radius.circular(50)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child:Image.network(
                                        'https://res.weread.qq.com/wrepub/epub_27185001_79',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.fill
                                      )
                                    )
                                  )
                                )
                              ]
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5,0,0,0),
                                hintText: '请输入',// 默认显示文字
                                hintStyle: TextStyle(fontSize: 20.0)
                              )
                            ),
                            Container(
                              height: 100.0,
                              margin: EdgeInsets.all(10),
                              // decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                clipBehavior: Clip.antiAlias,// 抗锯齿
                                child:PageView(
                                children: <Widget>[
                                  _item('page1',Colors.deepPurple),
                                  _item('page1',Colors.blue),
                                  _item('page1',Colors.red),
                                ]
                               )
                              )
                            ),
                            Column(
                              children: <Widget>[
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                  decoration: BoxDecoration(color: Colors.greenAccent),
                                  child: Text('宽度撑满')
                                )
                                )
                              ]
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
      ):Column(
        children: <Widget>[
          Text('列表'),
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Text('拉伸填满高度')
          ),
          )
         
        ]
      ),
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
  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0,1),
          style: TextStyle(fontSize: 10),
        )
      )
    );
  }
}