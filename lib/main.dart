import 'package:flutter/material.dart';
import 'package:trip/main_flutter_layout.dart';
import 'package:trip/main_statefulwidget.dart';
import 'package:trip/main_statelesswidget.dart';
import 'package:trip/gesture.dart';
import 'package:trip/wechat.dart';
void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: "flutter router",
      home: StateFullGroupRoute(),
      routes: <String, WidgetBuilder> {
        'less':(BuildContext context) => MyApp(),
        'ful':(BuildContext context) => StateFullGroups(),
        'lay':(BuildContext context) => StateFullGroupLay(),
        'gest':(BuildContext context) => GesturePage(),
        'wetch':(BuildContext context) => Wechat(),
      }
    );
  }
}

class StateFullGroupRoute extends StatefulWidget{
  @override
  _StateFullGroupRouteState createState() => _StateFullGroupRouteState();
}
class _StateFullGroupRouteState extends State<StateFullGroupRoute> {
  bool byName = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // SwitchListTile(
          //   title: Text("通过路由名跳转"),
          //   value: byName, 
          //   onChanged: (value){
          //     setState((){
          //       byName=value;
          //     });
          // }),
        _item('Stateless',MyApp(),'less'),
        _item('Stateless',StateFullGroups(),'ful'),
        _item('Stateless',StateFullGroupLay(),'lay'),
        _item('gesture',GesturePage(),'gest'),
        _item('wechat',Wechat(),'wetch'),
        ],
      )
    );
  }
  _item(String title, page, String routeName) {
     return Container(
       child: RaisedButton(
         onPressed: () {
          if(byName) {
            Navigator.pushNamed(context, routeName);
          }else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
         },
         child: Text(title),
       )
     );
  }
}