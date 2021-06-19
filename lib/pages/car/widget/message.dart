import 'package:flutter/material.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('公告消息'),
        ),
        body: MyHomePageState());
  }
}

class MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollableListTabView(
      tabHeight: 48,
      tabs: [
        ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: Theme.of(context).primaryColor,
              label: Container(
                child: Text(
                  '公告消息',
                ),
              ),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (_, index) => ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor),
                  alignment: Alignment.center,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('公告消息 ${index + 1}'),
              ),
            )),
      ],
    );
  }
}
