import 'package:flutter/material.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';

class WalletPage extends StatefulWidget {
  WalletPage({Key key}) : super(key: key);

  @override
  _MineAddressPage createState() => _MineAddressPage();
}

class _MineAddressPage extends State<WalletPage> {
  _MineAddressPage({Key key});
  String result;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的钱包'),
      ),
      body: Center(
          child: Container(
        child: GesturePasswordWidget(
          lineColor: Colors.blue,
          errorLineColor: Colors.redAccent,
          singleLineCount: 3,
          identifySize: 80.0,
          minLength: 3,
          hitShowMilliseconds: 40,
          errorItem: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          normalItem: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          selectedItem: Container(
            width: 25.0,
            height: 25.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          hitItem: Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          answer: [0, 1, 4, 7, 8],
          // color: Theme.of(context).primaryColor,
          onComplete: (data) {
            print(data);
            setState(() {
              result = data.join(', ');
            });
          },
        ),
      )),
    );
  }
}
