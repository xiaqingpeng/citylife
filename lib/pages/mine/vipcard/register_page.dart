import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  final registerFormKey = GlobalKey<FormState>();
  String verification, telphone, password, repassword;
  bool check = false;

  void onFinish() {
    var checked = registerFormKey.currentState.validate();
    if (checked) {
      registerFormKey.currentState.save();

      debugPrint("$verification");
      debugPrint("$telphone");
      debugPrint("$password");
    }
  }

  String validatorTelphone(value) {
    if (value.isEmpty) {
      return '手机号码输入不为空';
    }
    if (value.length != 11) {
      return '手机号码位数为11位';
    }
    return null;
  }

  String validatorVerification(value) {
    if (value.isEmpty) {
      return '验证码输入不为空';
    }
    if (value.length != 6) {
      return '验证码位数为6位';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return '密码输入不为空';
    }

    return null;
  }

  String validatorRePassword(value) {
    if (value.isEmpty) {
      return '确认密码输入不为空';
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10.0),
                margin: EdgeInsets.only(top: 30),
                child: GestureDetector(
                  child: Text(
                    '已经注册、立即登录',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                        return Loginpage();
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
                        labelText: "手机号码",
                        prefixIcon: Icon(Icons.phone),
                        hintText: "请输入手机号",
                      ),
                      validator: validatorTelphone,
                      onSaved: (value) => {telphone = value},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "验证码",
                        prefixIcon: Icon(Icons.verified),
                        hintText: "请输入验证码",
                      ),
                      validator: validatorVerification,
                      onSaved: (value) => {verification = value},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "密码",
                        prefixIcon: Icon(Icons.lock),
                        hintText: "请输入密码",
                      ),
                      validator: validatorPassword,
                      onSaved: (value) => {password = value},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "确认密码",
                        prefixIcon: Icon(Icons.lock),
                        hintText: "请输入确认密码",
                      ),
                      validator: validatorRePassword,
                      onSaved: (value) => {repassword = value},
                    ),
                    CheckboxListTile(
                      value: check,
                      title: Text('开通并遵守协议'),
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (bool val) {
                        // val 是布尔值
                        setState(() {
                          check = val;
                        });
                      },
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
                          '注册',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
