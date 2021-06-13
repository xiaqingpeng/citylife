import 'package:flutter/material.dart';
// import 'package:provide/provide.dart';
import './pages/home/home_page.dart';
import './pages/home/position.dart';
import 'pages/category/category_detail.dart';
// import './provide/counter.dart';
// import './provide/theme.dart';
// import './provide/tabbarIndex.dart';
import './pages/home/widget/wallet.dart';
import './pages/home/widget/message.dart';
import './pages/weicome/index.dart';
import './pages/weicome/timer.dart';
import './pages/index_page.dart';
import './pages/car/mine_scan.dart';
import 'package:provider/provider.dart';
import './provide/color_theme_provider.dart';
// void main() {

//   var counter = Counter();
//   var theme = ThemeColor(); //主题颜色
//   var tabbarIndex = TabbarIndex(); // tabbarIndex
//   var provides = Providers();

//   provides
//     ..provide(Provider<Counter>.value(counter))
//     ..provide(Provider<ThemeColor>.value(theme))
//     ..provide(Provider<TabbarIndex>.value(tabbarIndex));
//   runApp(ProviderNode(child: MyApp(), providers: provides));
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/category_search': (BuildContext context) => new CategoryDetailPage(),
    '/home_page': (BuildContext context) => new HomePage(),
    '/home_postion': (BuildContext context) => new HomePosition(),
    '/drawer_wallet': (BuildContext context) => new WalletPage(),
    '/drawer_message': (BuildContext context) => new MessagePage(),
    '/timer_page': (BuildContext context) => new Timerpage(),
    '/index_page': (BuildContext context) => new IndexPage(),
    '/mine_scan': (_) => new MineScanPage(),
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
          home: WelcomePage(),
          routes: routes,
        );
      }),
    );
  }
}
