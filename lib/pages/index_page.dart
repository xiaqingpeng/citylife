import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'home/home_page.dart';
import 'category/category_page.dart';
import 'car/car_page.dart';
import 'mine/mine_page.dart';
import './dynamic/index.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/platform.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State with WidgetsBindingObserver {
  var bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.dynamic_feed), label: '动态'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '我的'),
  ];
  var tabBodies = [
    HomePage(),
    CategoryPage(),
    DynamicPage(),
    CarPage(),
    MinePage(),
  ];
  int currentIndex = 0;
  var currentpage;
  @override
  void initState() {
    currentpage = tabBodies[currentIndex];
    super.initState();
    if (!PlatformUtils.isWeb) {
      checkPermisson();
    }

    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && _isGoSetting) {
      if (!PlatformUtils.isWeb) {
        checkPermisson();
      }
    }
  }

  @override
  void dispose() {
    // 注销观察者
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // currentpage = tabBodies[currentIndex];
            // _pageController.jumpToPage(index);
            _pageController.animateToPage(currentIndex,
                duration: Duration(microseconds: 200), curve: Curves.easeInOut);
          });
        },
      ),
      // body: currentpage,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return tabBodies[index];
          },
          controller: _pageController,
          itemCount: tabBodies.length,
          onPageChanged: (int index) {
            print('$index');
            setState(() {
              currentIndex = index;
            });
          },
        ),
        // child: PageView(
        //   controller: _pageController,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: tabBodies,
        // ),
      ),
    );
  }

  void checkPermisson({PermissionStatus status}) async {
    // 权限
    Permission permission = Permission.storage;

    if (status == null) {
      // 权限状态
      status = await permission.status;
    }
    print(status);
    if (status == PermissionStatus.granted) {
     
    } else if (status==PermissionStatus.denied) {
      // 用户第一次申请拒绝
      showPermissonAlert(_list[0], '同意', permission);
    } else if (status==PermissionStatus.permanentlyDenied) {

       // 第二次申请
      showPermissonAlert(_list[1], '重试', permission,);
      // // 第二次用户拒绝
      // showPermissonAlert(_list[2], '去设置中心', permission,isSetting: true);
    } else {

    }
  }

  List<String> _list = [
    "为您更好的体验应用，所以需要获取你的手机文件存储权限,以保存你的偏好设置",
    "你已拒绝权限，所以无法保存你的一些偏好设置",
    "您已经拒绝权限,请在设置中心同意App权限申请",
    "其他错误"
  ];
  // 是否去设置中心
  bool _isGoSetting = false;
  void showPermissonAlert(
      String message, String rightString, Permission permission,
      {bool isSetting = false}) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('温馨提示'),
            content: Container(
              // alignment: Alignment.center,
              child: Text(message),
              padding: EdgeInsets.all(12),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('退出应用'),
                onPressed: () {
                  closeApp();
                },
              ),
              CupertinoDialogAction(
                child: Text('$rightString'),
                onPressed: () {
                  // 关闭弹窗
                  Navigator.of(context).pop();
                  if (isSetting) {
                    _isGoSetting = true;
                    // 去设置中心
                    openAppSettings();
                  } else {
                    // 申请权限
                    if (!PlatformUtils.isWeb) {
                      requestPermiss(permission);
                    }
                  }
                },
              ),
            ],
          );
        });
  }

  void requestPermiss(Permission permission) async {
    // 发起权限申请
    // ignore: unused_local_variable
    PermissionStatus status = await permission.request();
   
    // 校验
    checkPermisson();
  }

  // 关闭应用
  void closeApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
