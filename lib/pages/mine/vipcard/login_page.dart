import 'package:flutter/material.dart';
import 'package:citylife/pages/mine/mine_page.dart';
import 'register_page.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Loginpage();
  }
}

class _Loginpage extends State<Loginpage> {
  final registerFormKey = GlobalKey<FormState>();
  String password, telphone;
  bool check = false;
  void onFinish() {
    var checked = registerFormKey.currentState.validate();
    if (checked) {
      registerFormKey.currentState.save();

      debugPrint("$telphone");
      debugPrint("$password");
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(microseconds: 200),
        content: Text('登录成功...'),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      new Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (BuildContext context) {
            return MinePage();
          }),
        );
      });
    }
  }

  String validatorTelphone(value) {
    if (value.isEmpty) {
      return '手机号码输入不为空';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return '密码输入不为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                      return MinePage();
                    }),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_left),
                      Text('返回'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  child: Text(
                    '没有账号、立即注册',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                        return RegisterPage();
                      }),
                    );
                  },
                ),
                alignment: Alignment.centerLeft,
              ),
              Form(
                  key: registerFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "手机号",
                          prefixIcon: Icon(Icons.phone),
                          hintText: "请输入手机号",
                        ),
                        validator: validatorTelphone,
                        onSaved: (value) => {telphone = value},
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "密码",
                          prefixIcon: Icon(Icons.lock),
                          hintText: "请输入密码",
                        ),
                        validator: validatorPassword,
                        onSaved: (value) => {password = value},
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => {onFinish()},
                          color: Theme.of(context).accentColor,
                          elevation: 0.0,
                          child: Text(
                            '登录',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
