import 'package:flutter/material.dart';
import 'package:citylife/provide/theme.dart';
import 'package:citylife/pages/car/widget/connectivity.dart';
import 'package:citylife/pages/car/widget/scrolllist.dart';
import 'package:citylife/pages/car/widget/mine_scan.dart';
import 'package:citylife/pages/car/widget/AnimatedContainer.dart';
import 'package:citylife/pages/car/widget/message.dart';
import 'package:citylife/pages/car/widget/wallet.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Flutter高阶",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        IconData(0xe6ae, fontFamily: 'iconfont'),
                        color: ThemeColor().theme,
                      ),
                      title: Text("网诺连接"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ConnetivityPage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("滑动列表"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ScrollList();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("二维码扫描"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MineScanPage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("渐变动画"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return AnimatedContainerPage(
                                name: "渐变动画",
                              );
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6a8, fontFamily: 'iconfont'),
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("滚动列表"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MessagePage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6a8, fontFamily: 'iconfont'),
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("手势解锁"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return WalletPage();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
