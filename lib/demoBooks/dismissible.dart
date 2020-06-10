import 'package:flutter/material.dart';

class Dismissiblesss extends StatelessWidget {
  List<String> items = List<String>.generate(30, (i){
    return "列表项${ i+ 1}";
  } );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动删除'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item= items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction){
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("$item被删除了"),)
                );
              },
              child: ListTile(
                title: Text('$item'),
              ),
            );
          }
      ),
    );
  }
}
