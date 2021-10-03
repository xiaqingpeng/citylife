import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;
  List<String> list = ['explore', 'history', 'person', 'list'];

  void handleTapHandler(int index) {
    print(index);
    print('index');
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: Expanded(
              child: Text('BottomNavigationBarPage 底部导航控件',maxLines: 5,textAlign: TextAlign.center,),
            ),
            elevation: 10.0, // 阴影 默认4.0
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: Text(
              list[_currentIndex],
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: handleTapHandler,
            type: BottomNavigationBarType.fixed, // 当tabBar个数大于等于四个
            fixedColor: Colors.blue, // 激活背景颜色
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'history'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'person'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
            ],
          )),
    );
  }
}
