import 'package:flutter/material.dart';
import './enpty.dart';

// ignore: must_be_immutable
class UnDeliveryPage extends StatelessWidget {
  int id;
  String name;
  String mark;
  UnDeliveryPage({Key key, this.name, this.id, this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EnptyPage(name: name, id: id, mark: mark);
  }
}
