import 'dart:async';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../index_page.dart';

class Timerpage extends StatefulWidget {
  Timerpage({Key key}) : super(key: key);

  @override
  _welcomepageState createState() => _welcomepageState();
}

// ignore: camel_case_types
class _welcomepageState extends State<Timerpage> {
  int currentTime = 5;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    // 计时器创建
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentTime == 0) {
        _timer.cancel();
        goIndexPage();
        return;
      }
      //初始化设置 LogUtil
      LogUtil.init(isDebug: true);
      //输出日志
      LogUtil.v("$currentTime");
      setState(() {
        currentTime = currentTime - 1;
      });
    });
  }

  void goIndexPage() {
    //跳转到IndexPage，并且移除所有的页面直到timer_page
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => IndexPage()),
        ModalRoute.withName('/timer_page'));
  }

  // 计时器销毁
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goIndexPage();
      },
      child: Container(
        // margin: EdgeInsets.only(left: 40, top: 40),
        //设置 child 居中
        alignment: Alignment.center,
        height: 40,
        width: 100,
        //边框设置
        decoration: new BoxDecoration(
          //背景
          // color: Colors.white,
          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //设置四周边框
          border:
              new Border.all(width: 1, color: Theme.of(context).primaryColor),
        ),
        child: Text(
          "$currentTime",
        ),
      ),
    );
  }
}
