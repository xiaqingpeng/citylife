import 'package:flutter/material.dart';

class ScrollList extends StatefulWidget {
  ScrollList({Key key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<ScrollList> {
  List<String> list = ['全部', '支出', '收入'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动列表'),
      ),
      body: CustomTabWeiget(
        tabTitleList: list,
      ),
    );
  }
}

class CustomTabWeiget extends StatefulWidget {
  final List<String> tabTitleList;
  final int select;
  const CustomTabWeiget({
    Key key,
    this.tabTitleList,
    this.select = 0,
  }) : super(key: key);

  @override
  _CustomTabWeigetState createState() => _CustomTabWeigetState();
}

class _CustomTabWeigetState extends State<CustomTabWeiget> {
  List<TabModel> _list = [];
  int _currentIndex;
  @override
  void initState() {
    super.initState();
    initDataFunction();
  }

  void didUpdateWidget(covariant CustomTabWeiget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentIndex = widget.select;
    initDataFunction();
  }

  initDataFunction() {
    _list = [];

    for (int i = 0; i < widget.tabTitleList.length; i++) {
      String title = widget.tabTitleList[i];
      _list.add(TabModel(title: title, select: _currentIndex == i));
    }
    widget.tabTitleList.forEach((element) {
      _list.add(TabModel(title: element, select: _currentIndex == 1));
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      // ignore: missing_return
      itemBuilder: (BuildContext context, int index) {
        TabModel _tabModel = _list[index];
        Color bgcolor = Colors.grey[200];
        Color borderColor = Colors.grey[200];
        Color textColor = Colors.blue[200];
        if (_tabModel.select) {
          bgcolor = Colors.white;
          borderColor = Colors.blueAccent;
          textColor = Colors.blueAccent;
        }

        return GestureDetector(
          onTap: () {
            print(_tabModel.select);
            if (_tabModel.select) {
              return;
            }
            _list.forEach((TabModel element) {
              String title = element.title;
              String clickTitle = _tabModel.title;
              if (title == clickTitle) {
                element.select = true;
              } else {
                element.select = false;
              }
            });
            setState(() {
              
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: bgcolor,
                    border: Border.all(color: borderColor),
                  ),
                  child: Text(
                    '${_tabModel.title}',
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TabModel {
  String title;
  bool select;
  TabModel({this.title, this.select});
}
