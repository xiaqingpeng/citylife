import 'package:flutter/material.dart';
import './self_title.dart';
import './drawer.dart';

class DynamicPage extends StatefulWidget {
  DynamicPage({Key key}) : super(key: key);

  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  var text = '关注';

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: HomeAppBar(
            callBack: (String str) {
              print(text);
              setState(() {
                text = str;
              });
            },
          ) //注意这行, HomeAppBar 是我们自己写的
          ),
      body: Container(
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
