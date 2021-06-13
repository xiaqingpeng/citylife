import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({this.callBack});
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    //横向布局
    return Row(
      children: <Widget>[
        //因为它是左右占比结构,所以使用Expanded 的flex
        Expanded(
          flex: 1,
          child: Container(
            //所有组件垂直居中
            alignment: Alignment.center,
            height: 40,
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  //常用于Row和Column控件
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        '关注',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () {
                        this.callBack('关注');
                        // print('关注');
                      },
                    ),
                    // SizedBox(
                    //   width: 15,
                    // ),
                    InkWell(
                      child: Text(
                        '热门',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () {
                        this.callBack('热门');
                       
                      },
                    ),
                    // SizedBox(
                    //   width: 15,
                    // ),
                    InkWell(
                      child: Text(
                        '圈子',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () {
                        this.callBack('圈子');
                        // print('圈子');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        Expanded(
          flex: 0,
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
