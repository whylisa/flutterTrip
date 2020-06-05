import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
     'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
     'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
     'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
  ];
  double appBarApha = 0;
  _onScroll(offset) {
    // 动态设置透明度
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    setState(() {
      appBarApha = alpha;
    });
    print(appBarApha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 脚手架
      body: Stack( // 层叠元素
        children: <Widget>[
          MediaQuery.removePadding( // 移除padding
              removeTop: true,// 移除哪边的padding
              context: context,
              child: NotificationListener( // 监听滚动
                onNotification: (scrollNotification){
                  // 第0个元素触发滚动监听
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth==0){
                    // 滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView( // 列表
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),

                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text("hiahi")),
                    )
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarApha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
