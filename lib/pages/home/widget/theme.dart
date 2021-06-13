import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provide/color_theme_provider.dart';

class ThemePage extends StatefulWidget {
  ThemePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '颜色主题',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ExpansionTile(
              title: Text('颜色主题'),
              leading: Icon(Icons.color_lens),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      ...Colors.primaries.map(
                        (color) => Material(
                          color: color,
                          child: InkWell(
                            onTap: () {
                              print(color);
                              context
                                  .read<ColorThemeProvider>()
                                  .changeColor(color: color);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
