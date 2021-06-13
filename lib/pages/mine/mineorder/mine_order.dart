import 'package:flutter/material.dart';
import './allgoods.dart';
import './unpayment.dart';
import './undelivery.dart';
import './ungoods.dart';
import './unevaluate.dart';
// ignore: must_be_immutable
class MineOrderPage extends StatefulWidget {
  String title;
  int id;
  MineOrderPage({this.title, this.id});

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<MineOrderPage>
    with SingleTickerProviderStateMixin {
  TabController tabbarController;
  @override
  void initState() {
    tabbarController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30,),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width:MediaQuery.of(context).size.width,
                    child: TabBar(
                      controller: tabbarController,
                      labelColor: Theme.of(context).primaryColor,
                      isScrollable: true,
                      labelStyle: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),
                      tabs: <Widget>[
                        Tab(text: "全部"),
                        Tab(text: "待付款"),
                        Tab(text: "待发货"),
                        Tab(text: "待收货"),
                        Tab(text: "待评价")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-200,
                  child: TabBarView(
                  
                    controller: tabbarController,
                    children: <Widget>[
                      AllGoodsPage(),
                      UnPaymentPage(),
                      UnDeliveryPage(),
                      UnGoodsPage(),
                      UnEvaluatePage()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
