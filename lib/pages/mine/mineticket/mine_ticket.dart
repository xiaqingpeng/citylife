import 'package:flutter/material.dart';
import './wait_used.dart';
import './has_used.dart';
import './lose_used.dart';
import './lose_used.dart';
import './card_package.dart';

class MineTicketPage extends StatefulWidget {
  String name;
  int id;
  MineTicketPage({this.name, this.id});

  @override
  _Home2State createState() => _Home2State(name: this.name);
}

class _Home2State extends State<MineTicketPage> {
  String name;
  _Home2State({this.name});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, //配置顶部tab的数量
      child: Scaffold(
        appBar: AppBar(
          title: Text("${name}"),
          //配置顶部导航栏
          bottom: TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            // labelStyle: TextStyle(fontSize: 12),
            tabs: <Widget>[
              Tab(text: "待使用"),
              Tab(text: "已使用"),
              Tab(text: "已失效"),
              Tab(text: "卡包"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            WaitUsedPage(),
            HasUsedPage(),
            LoseUsedPage(),
            CardPackage(),
          ],
        ),
      ),
    );
  }
}
