import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class HeaderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<HeaderPage> {
  var _imgPath;
  final picker = ImagePicker();
  /*拍照*/
  _openGallery() async {
    // ignore: deprecated_member_use
    var image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.cyanAccent[100],
            Colors.purple[100],
            Colors.cyanAccent[100],
          ],
        ),
      ),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container(
                  width: 100.0,
                  height: 100.0,
                  // margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: _imgPath == null
                        ? Image.asset(
                            "images/swiper1.png",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _imgPath,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                    onTap: () => {_openGallery()},
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.cyanAccent,

                    border: Border.all(
                      color: Colors.white, //边框颜色
                      style: BorderStyle.solid,
                      width: 2.0, // 边框宽度
                    ),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50.0)),
                  ),
                ),
                new GestureDetector(
                  onTap: () => {
                    showDialog(
                        // 传入 context
                        context: context,
                        barrierDismissible: false,
                        // 构建 Dialog 的视图
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('我的登录'),
                            content: Text('你确定登录吗？'),
                            actions: [
                              // ignore: deprecated_member_use
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('取消')),
                              // ignore: deprecated_member_use
                              FlatButton(
                                  onPressed: () {
                                    // Fluttertoast.showToast(
                                    //     msg: "登录成功",
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIosWeb: 1,
                                    //     backgroundColor:
                                    //         Theme.of(context).primaryColor,
                                    //     textColor: Colors.white,
                                    //     fontSize: 16.0);
                                    // Navigator.pop(context);
                                  },
                                  child: Text('确定'))
                            ],
                          );
                        })
                  },
                  child: new Text(
                    '夏庆鹏',
                    style: new TextStyle(
                        // color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
