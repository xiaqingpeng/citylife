import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Text 控件'),
          elevation: 10.0, // 阴影 默认4.0
          backgroundColor: Colors.blue,
        ),
        
        body: Center(
          // 对于从左到右的文本（TextDirection.ltr），文本从左向右流动；
          // 对于从右到左的文本（TextDirection.rtl），文本从右向左流动。
          child: Text(
            'center widget',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.cyan),
          ),
        ),
      
      ),
    );
  }
}
