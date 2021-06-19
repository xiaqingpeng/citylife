import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedContainerPage extends StatefulWidget {
  int id;
  String name;
  AnimatedContainerPage({Key key, this.name, this.id}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState(id: this.id, name: this.name);
}

class _MyAppState extends State<AnimatedContainerPage>
    with SingleTickerProviderStateMixin {
  int id;
  String name;

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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('$name'),
      ),
      body: Center(child: AnimatedContainerWidget()),
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
