import 'package:flutter/material.dart';

import '../index_page.dart';
import './mine_scan.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goIndexPage() {
      //跳转到IndexPage，并且移除所有的页面直到timer_page
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => IndexPage()),
          ModalRoute.withName('/timer_page'));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          actions: <Widget>[
            IconButton(
                icon: new Icon(
                  IconData(0xe7d4, fontFamily: 'iconfont'),
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('history....');
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return MineScanPage();
                  }));
                }),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.shopping_cart,
                size: 50.0,
                color: Colors.white,
              ),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50.0))),
            ),
            Container(
              child: Text('购物车还是空着，快去挑选商品'),
              margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
            ),
            RaisedButton(
              onPressed: () {
                goIndexPage();
              },
              child: Text(
                '购物车还是空着，快去挑选商品',
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        )));
  }
}
