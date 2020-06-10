import 'package:flutter/material.dart';
class MytabBar extends StatelessWidget {
  final List<Tab> myTypes = <Tab>[
    Tab(text: 'choose11',),
    Tab(text: 'choose22',)
  ];

//  Scaffold(
//  appBar: AppBar(
//  title: Text(
//  'app title'
//  ),
//  bottom: TabBar(
//  tabs: myTypes,
//  ),
//  ),
//  body: TabBarView(
//  children: myTypes.map((Tab tab){
//  return Center(
//  child: Text(tab.text),
//  );
//  }).toList(),
//  ),
//  ),

//  Column(
//  children: <Widget>[
//  TabBar(
//  tabs: myTypes,
//  ),
//  TabBarView(
//  children: myTypes.map((Tab tab) {return Center(
//  child: Text(tab.text),
//  );}).toList()
//  )
//  ],
//  )


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTypes.length,
        child:   Scaffold(
          appBar: AppBar(
            title: Text(
                'app title'
            ),
//            bottom: TabBar(
//              tabs: myTypes,
//            ),
          ),
          body:  Column(
            children: <Widget>[
              Container(
                height: 40,
                color: Colors.blue,
                child:  TabBar(
                  tabs: myTypes,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.red,
//                labelStyle: TextStyle(backgroundColor: Colors.red),
                ),
              ),
//              TabBar(
//                tabs: myTypes,
//                labelColor: Colors.red,
//                unselectedLabelColor: Colors.blue,
////                labelStyle: TextStyle(backgroundColor: Colors.red),
//              ),
              Expanded(
                flex: 1,
                child:  TabBarView(
                    children: myTypes.map((Tab tab) {return Center(
                      child: Text(tab.text),
                    );}).toList()
                ),
              )

            ],
          )
        ),
      ),
    );
  }
}
