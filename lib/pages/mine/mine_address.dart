import 'package:flutter/material.dart';
import 'dart:convert';

class MineAddressPage extends StatelessWidget {
  int id;
  String name;
  MineAddressPage({Key key, this.name,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: Center(
        child: Text('$name'),
      ),
    );
  }
}
