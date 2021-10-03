import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab 选项卡控件'),
          elevation: 10.0, // 阴影 默认4.0
          backgroundColor: Colors.blue,
        ),
        body: DefaultTabController(
          // 标签数量
          length: 9,
          child: Column(children: [
            SizedBox(
                height: 60,
                child: Expanded(
                    child: TabBar(
                  // 多个标签时滚动加载
                  isScrollable: true,
                  // 标签指示器的颜色
                  indicatorColor: Colors.red,
                  // 标签的颜色
                  labelColor: Colors.blue,
                  // 未选中标签的颜色
                  unselectedLabelColor: Colors.black,
                  // 指示器的大小
                  indicatorSize: TabBarIndicatorSize.label,
                  // 指示器的权重，即线条高度
                  indicatorWeight: 4.0,
                  tabs: <Widget>[
                    Tab(text: "热销"),
                    Tab(text: "推荐"),
                    Tab(text: "搞笑"),
                    Tab(text: "妙招"),
                    Tab(text: "关注"),
                    Tab(text: "时尚"),
                    Tab(text: "女性"),
                    Tab(text: "服装"),
                    Tab(text: "男性"),
                  ],
                ))),

            // 标签页所对应的页面
            SizedBox(
              height: 500,
              child: TabBarView(
                children: <Widget>[
                  ListView(children: <Widget>[ListTile(title: Text("热销内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("推荐内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("搞笑内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("妙招内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("关注内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("时尚内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("女性内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("服装内容"))]),
                  ListView(children: <Widget>[ListTile(title: Text("男性内容"))]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
