import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class CardPackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return EnptyPage();
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ["1", "2"];
  final screenWidth = window.physicalSize.width;
  final screenHeight = window.physicalSize.height;
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        // WaterDropHeader、ClassicHeader、CustomHeader、LinkHeader、MaterialClassicHeader、WaterDropMaterialHeader
        header: ClassicHeader(
          height: 45.0,
          releaseText: '松开手刷新',
          refreshingText: '刷新中',
          completeText: '刷新完成',
          failedText: '刷新失败',
          idleText: '下拉刷新',
        ),

        // ClassicFooter、CustomFooter、LinkFooter、LoadIndicator
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Text('oop'),
      ),
    );
  }

  // don't forget to dispose refreshController
  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }
}

class CardListItem extends StatelessWidget {
  String item;
  CardListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shadowColor: Colors.grey,
        elevation: 15.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              // title: new Text(
              //   item,
              //   style: new TextStyle(fontWeight: FontWeight.w500),
              // ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Divider(),
                  new Text('说明 综超门店 三全部分火锅食材类别可用'),
                  new Divider(),
                  new Text('券编号 [领取优惠券]1234567890'),
                  new Divider(),
                  new Text('日期 2020-12-12至2021-1-25'),
                ],
              ),
              title: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Icon(
                    Icons.card_giftcard,
                    color: Colors.pink[500],
                  ),
                 
                  new Text(
                    '  ${item}元',
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ],
              ),
            ),
            new Divider()
          ],
        ),
      ),
    );
  }
}

