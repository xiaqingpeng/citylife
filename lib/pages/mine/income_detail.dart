import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

// ignore: must_be_immutable
class IncomeDetailPage extends StatefulWidget {
  int id;
  String name;
  IncomeDetailPage({Key key, this.name, this.id}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState(id: this.id, name: this.name);
}

class _MyAppState extends State<IncomeDetailPage>
    with SingleTickerProviderStateMixin {
  int id;
  String name;
  // ignore: non_constant_identifier_names
  String MenuItem = '今天';
  // ignore: unused_element
  _MyAppState({Key key, this.name, this.id});
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    // 动画控制器创建
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(microseconds: 1400),
    );
    // 添加一个监听
    _animationController.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('$name'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(MenuItem),
              PopupMenuButton(
                  icon: Icon(Icons.date_range),
                  offset: Offset(80, 80),
                  onSelected: (value) {
                    print(value);
                    setState(() => {MenuItem = value});
                  },
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(value: '今天', child: Text('今天')),
                        PopupMenuItem(value: '本周', child: Text('本周')),
                        PopupMenuItem(value: '本月', child: Text('本月'))
                      ])
            ],
          )
        ],
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Container(
              child: EchartsView(MenuItem: MenuItem),
              width: 300,
              height: 250,
            ),
            SizedBox(
              height: 100,
            ),
            AnimatedContainerWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('开始'),
        onPressed: () {
          if (_animationController.isCompleted) {
            // 如果动画执行完毕了，就反向执行；
            _animationController.reverse();
          } else {
            // 重置动画
            _animationController.reset();
            // 正向执行
            _animationController.forward();
          }
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget AnimatedContainerWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 18,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  child: Container(
                    height: 16,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            height: 16,
                            color: Colors.grey,
                          ),
                        ),
                        ClipRRect(
                          child: Align(
                            widthFactor: _animationController.value,
                            child: Container(
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.purple],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Text('100条'),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class EchartsView extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String MenuItem;
  // ignore: non_constant_identifier_names
  EchartsView({Key key, this.MenuItem}) : super(key: key);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (MenuItem == "今天") {
      return Echarts(
        option: '''
    {
      xAxis: {
        type: 'category',
        data: ['1h','2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h','13h','14h','15h','16h','17h','18h','19h','20h','21h','22h','23h','24h']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [50,65,70,100,20,30,90,200,250,265,370,400,320,730,590,900,850,565,770,800,620,730,790,800,],
        type: 'line'
      }]
    }
  ''',
      );
    } else if (MenuItem == "本周") {
      return Echarts(
        option: '''
    {
      xAxis: {
        type: 'category',
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line'
      }]
    }
  ''',
      );
    } else if (MenuItem == "本月") {
      return Echarts(
        option: '''
    {
      xAxis: {
        type: 'category',
        data: ['1号','2号','3号','4号','5号','6号','7号','8号','9号','10号','11号','12号','13号','14号','15号','16号','17号','18号','19号','20号','21号','22号','23号','24号','25号','26号','27号','28号','29号','30号',]
      },
      yAxis: {
        type: 'value'
      },
      series: [{
       data: [150,165,170,1100,120,130,190,1200,1250,2265,2370,2400,2320,2330,2590,2900,2850,2565,2770,2800,2620,2730,2790,2800,2150,2165,3170,3100,3120,3130,],
        type: 'line'
      }]
    }
  ''',
      );
    }
  }
}

// ignore: non_constant_identifier_names
