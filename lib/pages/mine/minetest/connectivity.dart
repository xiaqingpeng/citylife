import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import './utils.dart';

class ConnetivityPage extends StatefulWidget {
  ConnetivityPage({Key key}) : super(key: key);

  @override
  _ConnetivityPageState createState() => _ConnetivityPageState();
}

class _ConnetivityPageState extends State<ConnetivityPage> {
  StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('网诺检测'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Connectivity().checkConnectivity();
                print(result);
                showConnectivitySnackBar(result);
              },
              child: Text(
                '网诺检测',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet ? '连接结果:${result.toString()}' : '没有连接到Internet';
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
  }
}
