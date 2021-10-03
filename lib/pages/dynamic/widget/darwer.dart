import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('darwer 抽底控件'),
          elevation: 10.0, // 阴影 默认4.0
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text('darwer 抽底控件'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('夏庆鹏'),
                accountEmail: Text('626143872@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img2.woyaogexing.com/2019/09/06/f9afde08c5a4460cb08389a6c7f74c7a!600x600.jpeg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cms-dumall.cdn.bcebos.com/cms_upload_pro/cms_1633138913464.jpg?x-bce-process=image/quality,q_80/format,f_auto/interlace,i_progressive'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.yellow[400].withOpacity(0.5),
                          BlendMode.hardLight)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
