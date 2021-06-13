import 'dart:io';
import 'package:flutter/material.dart';
import 'package:citylife/provide/theme.dart';
import './widget/wallet.dart';
import './widget/message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widget/theme.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<MyDrawer> {
  var _imgPath;
  File _image;
  final picker = ImagePicker();
  /*拍照*/

  /*相册*/
  _openGallery() async {
    // ignore: deprecated_member_use
    var image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }

  Future getSharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    print("$prefs++++++++++++++++++++++++++++++++=");
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: InkWell(
                        child: _imgPath == null
                            ? Image.network(
                                "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg",
                                width: 80.0,
                                height: 80.0,
                              )
                            : Image.file(
                                _imgPath,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                        onTap: () => {_openGallery()},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "夏庆鹏",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.wallet_giftcard,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("我的钱包"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return WalletPage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6ae, fontFamily: 'iconfont'),
                        color: ThemeColor().theme,
                      ),
                      title: Text("我的相册"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        IconData(0xe6a8, fontFamily: 'iconfont'),
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("公告消息"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MessagePage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.color_lens,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("颜色主题"),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ThemePage();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("设置"),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
