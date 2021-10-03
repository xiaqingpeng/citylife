import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewBuilderPage extends StatelessWidget {
  Widget itemBuilder(BuildContext context, int index) {
    return Container(
      child: Column(
        children: [
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 16.0,
          ),
          Text(
            posts[index].title,
            style: TextStyle( fontSize: 20.0,),
          ),
         
          Text(
            posts[index].author,
            style: TextStyle( fontSize: 16.0,),
          ),
        ],
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView.builder 列表控件'),
          elevation: 10.0, // 阴影 默认4.0
          backgroundColor: Colors.blue,
        ),
        body: Center(
          // 对于从左到右的文本（TextDirection.ltr），文本从左向右流动；
          // 对于从右到左的文本（TextDirection.rtl），文本从右向左流动。
          child: ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: posts.length,
          ),
        ),
      ),
    );
  }
}
