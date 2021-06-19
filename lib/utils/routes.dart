import 'package:citylife/pages/category/category_detail.dart';
import 'package:citylife/pages/home/home_page.dart';
import 'package:citylife/pages/home/position.dart';
import 'package:citylife/pages/car/widget/message.dart';
import 'package:citylife/pages/car/widget/wallet.dart';
import 'package:citylife/pages/mine/about_mall.dart';
import 'package:citylife/pages/mine/income_detail.dart';
import 'package:citylife/pages/mine/mine_address.dart';
import 'package:citylife/pages/mine/mine_detail.dart';
import 'package:citylife/pages/mine/mineorder/mine_order.dart';
import 'package:citylife/pages/mine/mineorder/undelivery.dart';
import 'package:citylife/pages/mine/mineorder/unevaluate.dart';
import 'package:citylife/pages/mine/mineorder/ungoods.dart';
import 'package:citylife/pages/mine/mineorder/unpayment.dart';
import 'package:citylife/pages/mine/mineservice/mine_service.dart';
import 'package:citylife/pages/mine/mineticket/mine_ticket.dart';
import 'package:citylife/pages/mine/qrcode_page.dart';
import 'package:citylife/pages/mine/vipcard/login_page.dart';
import 'package:citylife/pages/mine/vipcard/register_page.dart';
import 'package:citylife/pages/weicome/timer.dart';
import 'package:citylife/pages/index_page.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class routeUtils {
  static final routes = {
    '/category_search': (BuildContext context) => new CategoryDetailPage(),
    '/home_page': (BuildContext context) => new HomePage(),
    '/home_postion': (BuildContext context) => new HomePosition(),
    '/drawer_wallet': (BuildContext context) => new WalletPage(),
    '/drawer_message': (BuildContext context) => new MessagePage(),
    '/timer_page': (BuildContext context) => new Timerpage(),
    '/index_page': (BuildContext context) => new IndexPage(),



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
  };
}
