import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip/dao/home_dao.dart';
import 'package:trip/model/common_model.dart';
import 'package:trip/model/grid_nav_model.dart';
import 'package:trip/model/home_model.dart';
import 'package:trip/model/sales_box_model.dart';
import 'package:trip/widget/grid_nav.dart';
import 'package:trip/widget/loadingContainer.dart';
import 'package:trip/widget/local_nav.dart';
import 'package:trip/widget/sales_box.dart';
import 'package:trip/widget/sub_nav.dart';

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


  String resultString = '';
  double appBarApha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxlist;
  bool _loading = true;

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
  initState() {
    super.initState();
    _handRefresh();

  }
  Future<Null> _handRefresh() async{
//    HomeDao.fetch().then((value){
//      setState(() {
//        resultString = json.encode(value);
//      });
//    }).catchError((e){
//      setState(() {
//        resultString = e.toString();
//      });
//    });
  try{
    HomeModel model = await HomeDao.fetch();
    setState(() {
      localNavList = model.localNavList;
      gridNavModel = model.gridNav;
      subNavList = model.subNavList;
      salesBoxlist = model.salesBox;
      _loading = false;
    });
  }catch(e){
    setState(() {
      resultString = e.toString();
      _loading = false;

    });
  }
  return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 脚手架
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack( // 层叠元素
          children: <Widget>[
            MediaQuery.removePadding( // 移除padding
                removeTop: true,// 移除哪边的padding
                context: context,
                child: RefreshIndicator(
                  onRefresh: _handRefresh,
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        ),
                        LocalNav(localNavList: localNavList,),
                        GridNav(gridNavModel: gridNavModel,),
                        SubNav(subNavList: subNavList,),
                        SalesBox(salesBox: salesBoxlist,),
                        Container(
                          height: 800,
                          child: ListTile(title: Text(resultString)),
                        )
                      ],
                    ),
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
        ),)
    );
  }
}
