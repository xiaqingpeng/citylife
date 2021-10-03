import 'package:flutter/material.dart';
import 'package:citylife/provide/theme.dart';
import 'widget/text.dart';

import 'widget/listviewbuilder.dart';
import 'widget/tab.dart';
import 'widget/darwer.dart';

class DynamicUtils {
  // ignore: non_constant_identifier_names
  static List  DynamicLists = [
    {
      "text": "Text 文本控件",
      "icon": 0xe6ae,
      "content": TextPage(),
    },
    {
      "text": "ListView.builder 列表控件",
      "icon": 0xe6ae,
      "content": ListViewBuilderPage(),
    },
    {
      "text": "tab 选项卡控件",
      "icon": 0xe6ae,
      "content": TabPage(),
    },
    {
      "text": "darwer 抽底控件",
      "icon": 0xe6ae,
      "content": DrawerPage(),
    },
  ];
}

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
                  "Flutter控件",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView(
                  children: DynamicUtils.DynamicLists.map(
                    (e) => ListTileItem(
                      text: e['text'],
                      icon: e['icon'],
                      content: e['content'],
                    ),
                  ).toList(),
                ),
              )
            ],
          )),
    );
  }

  //  ListTileItem控件封装
  // ignore: non_constant_identifier_names
  Widget ListTileItem(
      {String text = "flutter 控件",
      int icon = 0xe6ae,
      Widget content,
      Key key}) {
    print(text);
    print(icon);
    print(content);
    return ListTile(
      leading: Icon(
        IconData(icon, fontFamily: 'iconfont'),
        color: ThemeColor().theme,
      ),
      title: Text('$text'),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return content;
            },
          ),
        );
      },
    );
  }
}
