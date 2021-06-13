import 'package:flutter/material.dart';
import './mine_detail.dart';
import 'mineservice/mine_service.dart';
import 'mineorder/mine_order.dart';
import 'mineticket/mine_ticket.dart';
import './income_detail.dart';
import './qrcode_page.dart';
import './about_mall.dart';
import './mine_address.dart';
import './vipcard/login_page.dart';
import './vipcard/register_page.dart';
import 'mineorder/unpayment.dart';
import 'mineorder/undelivery.dart';
import 'mineorder/ungoods.dart';
import 'mineorder/unevaluate.dart';
import 'package:provider/provider.dart';
import '../../provide/color_theme_provider.dart';
import './minetest/scrolllist.dart';
import './minetest/minebattery.dart';
import './minetest/connectivity.dart';
class MinePage extends StatelessWidget {
  final routes = {
    '/mine_detail': (BuildContext context) => new MineDetailPage(),
    '/mine_service': (BuildContext context) => new MineServicePage(),
    '/mine_order': (_) => new MineOrderPage(),
    '/mine_address': (_) => new MineAddressPage(),
    '/mine_ticket': (_) => new MineTicketPage(),
    '/income_detail': (_) => new IncomeDetailPage(),
    '/qrcode_page': (_) => new QrcodePage(),
    '/about_mall': (_) => new AboutMallPage(),
    '/login_page': (_) => new Loginpage(),
    '/register_page': (_) => new RegisterPage(),
    '/evaluate_page': (BuildContext context) => new UnEvaluatePage(),
    '/goods_page': (BuildContext context) => new UnGoodsPage(),
    '/payment_page': (BuildContext context) => new UnPaymentPage(),
    '/delivery_page': (BuildContext context) => new UnDeliveryPage(),
    '/scrolllist_page': (BuildContext context) => new ScrollList(),
    '/mine_battery': (BuildContext context) => new BatteryPage(),
    '/mine_connecttivity': (BuildContext context) => new ConnetivityPage(),
  };
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorThemeProvider(),
      child: Consumer<ColorThemeProvider>(
          builder: (context, colorThemeProvider, child) {
        print(colorThemeProvider.color);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false, // 去除debugger
          theme: ThemeData(
            primarySwatch: colorThemeProvider.color,
          ),
          home: Scaffold(
              body: ListView(
            children: <Widget>[ButtonPage(), TabNavigator(), TabList()],
          )),
          routes: routes,
        );
      }),
    );
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return Loginpage();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  // color: Colors.cyanAccent,

                  border: Border.all(
                    color: Colors.white, //边框颜色
                    style: BorderStyle.solid,
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Image.network(
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg",
                ),
              ),
              Text('登录/注册'),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ));
  }
}

class TabNavigator extends StatelessWidget {
  final List navigatorList = [
    {'name': '待付款', 'id': 1, 'icon': 0xe60f},
    {'name': '待发货', 'id': 2, 'icon': 0xe656},
    {'name': '待收货', 'id': 3, 'icon': 0xe624},
    {'name': '待评价', 'id': 4, 'icon': 0xe606},
  ];

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print(item);
        Navigator.push(
          context,
          new MaterialPageRoute(
            // ignore: missing_return
            builder: (BuildContext context) {
              if (item['name'] == '待付款') {
                return UnPaymentPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待发货') {
                return UnDeliveryPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待收货') {
                return UnGoodsPage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else if (item['name'] == '待评价') {
                return UnEvaluatePage(
                    name: item['name'], id: item['id'], mark: 'order');
              } else {
                print('888');
              }
            },
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            IconData(item['icon'], fontFamily: 'iconfont'),
            color: Colors.black54,
          ),
          Text(
            item['name'],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      // margin: const EdgeInsets.only(bottom: 20.0),
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: navigatorList.map((item) {
            return _gridViewItemUi(context, item);
          }).toList()),
    );
  }
}

class TabList extends StatelessWidget {
  final List navigatorList = [
    {'name': '我的订单', 'id': 1, 'icon': 0xe620},
    {'name': '我的优惠券', 'id': 2, 'icon': 0xe60c},
    {'name': '地址管理', 'id': 4, 'icon': 0xe622},
    {'name': '关于商城', 'id': 5, 'icon': 0xe607},
    {'name': '扫码进行投诉', 'id': 6, 'icon': 0xe7d4},
    {'name': '分享收入明细', 'id': 7, 'icon': 0xe610},
    {'name': '售后服务', 'id': 8, 'icon': 0xe67f},
    {'name': '滑动列表', 'id': 9, 'icon': 0xe67f},
    {'name': '我的电量', 'id': 10, 'icon': 0xe67f},
    {'name': '检测网诺', 'id': 11, 'icon': 0xe67f},
  ];

  Widget _listViewItemUi(BuildContext context, item) {
    return Column(children: <Widget>[
      Divider(
        height: 2.0,
        indent: 0.0,
        color: Colors.grey,
      ),
      ListTile(
        title: new Text(item["name"],
            style: new TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            )),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) {
                if (item['name'] == '售后服务') {
                  return MineServicePage(name: item['name'], id: item['id']);
                } else if (item['name'] == '滑动列表') {
                  return ScrollList();
                }
                else if (item['name'] == '我的电量') {
                  return BatteryPage();
                }  
                else if (item['name'] == '检测网诺') {
                  return ConnetivityPage();
                }  
                
                else if (item['name'] == '我的订单') {
                  return MineOrderPage(title: item['name'], id: item['id']);
                } 
                else if (item['name'] == '扫码进行投诉') {
                  return QrcodePage(name: item['name'], id: item['id']);
                } else if (item['name'] == '分享收入明细') {
                  return IncomeDetailPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '我的优惠券') {
                  return MineTicketPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '地址管理') {
                  return MineAddressPage(name: item['name'], id: item['id']);
                } else if (item['name'] == '关于商城') {
                  return AboutMallPage(
                      title: item['name'],
                      id: item['id'],
                      url: 'https://www.jd.com/');
                } else {
                  return MineDetailPage(name: item['name'], id: item['id']);
                }
              },
            ),
          );
          // Navigator.of(context).pushNamed('/mine_detail',arguments: item);
        },
        leading: new Icon(
          // item["icon"],
          IconData(item['icon'], fontFamily: 'iconfont'),
          color: Colors.black54,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: navigatorList.map((item) {
      return _listViewItemUi(context, item);
    }).toList());
  }
}
