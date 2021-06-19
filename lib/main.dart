import 'package:flutter/material.dart';
import 'package:citylife/utils/routes.dart';
import 'package:citylife/pages/weicome/index.dart';
import 'package:citylife/provide/color_theme_provider.dart';
import 'package:provider/provider.dart';

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

// ignore: camel_case_types

class MyApp extends StatelessWidget {
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
          routes: routeUtils.routes,
        );
      }),
    );
  }
}
