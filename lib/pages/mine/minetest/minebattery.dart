import 'dart:async';

import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class BatteryPage extends StatefulWidget {
  BatteryPage({Key key}) : super(key: key);

  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  final battery = Battery();
  int batteryLevel = 100;
  Timer timer;
  BatteryState batteryState = BatteryState.full;
  // ignore: cancel_subscriptions
  StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    listenBatteryLevel();
    listenBatteryState();
  }

  void listenBatteryState() => {
        subscription = battery.onBatteryStateChanged.listen(
          (batteryState) => setState(() => this.batteryState = batteryState),
        )
      };
  void listenBatteryLevel() {
    updateBatterylevel();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      updateBatterylevel();
    });
  }

  Future updateBatterylevel() async {
    final batteryLevel = await battery.batteryLevel;
    setState(() {
      this.batteryLevel = batteryLevel;
    });
  }

  void dispose() {
    timer.cancel();
    subscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('手机电池电量'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildBatteryState(batteryState),
            const SizedBox(
              height: 32,
            ),
            buildBatteryLevel(batteryLevel),
          ],
        ),
      ),
    );
  }

  // 电池转态
  // ignore: missing_return
  Widget buildBatteryState(BatteryState batteryState) {
    final style = TextStyle(fontSize: 32, color: Colors.white);
    final double size = 300;
    switch (batteryState) {
      case BatteryState.full:
        final color = Colors.green;
        return Column(
          children: [
            Icon(
              Icons.battery_std_rounded,
              size: size,
              color: color,
            ),
            Text(
              '能量满满',
              style: style.copyWith(color: color),
            )
          ],
        );
      case BatteryState.charging:
        final color = Colors.green;
        return Column(
          children: [
            Icon(
              Icons.battery_std_rounded,
              size: size,
              color: color,
            ),
            Text(
              '补充能量...',
              style: style.copyWith(color: color),
            )
          ],
        );
      case BatteryState.discharging:
      default:
        final color = Colors.red;
        return Column(
          children: [
            Icon(
              Icons.battery_std_rounded,
              size: size,
              color: color,
            ),
            Text(
              '掉线了...',
              style: style.copyWith(color: color),
            )
          ],
        );
    }
  }

  //电池能量
  Widget buildBatteryLevel(int batteryLevel) {
    return Text(
      '$batteryLevel%',
      style: TextStyle(
          fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
