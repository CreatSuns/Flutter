import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';

import '../Notices.dart';
import '../Setting.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('个人中心'),
          backgroundColor: BaseColors.colorTheme,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
          ],
        ),
        body: Container(
          child: MineBody(),
        ),
    );
  }
}

class MineBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorTheme,
                    ),
                    width: double.infinity,
                    height: 120,
                  ),
                  Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorF6F6F6,
                    ),
                    width: double.infinity,
                    height: 80,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 12, top: 15),
                child: ClipRRect(
                  //圆角图片
                  borderRadius: BorderRadius.circular(8),

                  child: Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorWhite,
                    ),
                    width: double.infinity,
                    height: 166,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 22),
                      child: CircleAvatar(
                        //分析 3
                        backgroundImage:
                            new AssetImage('images/pic_dongtaitouxiang.png'),
                        radius: 40.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "毛春江",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "联创",
                          style: TextStyle(
                              fontSize: 12, color: BaseColors.colorGray),
                        ),
                        Text(
                          "  |  ",
                          style: TextStyle(
                              fontSize: 12, color: BaseColors.colorGray),
                        ),
                        Text(
                          "分享商",
                          style: TextStyle(
                              fontSize: 12, color: BaseColors.colorGray),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(color: BaseColors.colorWhite),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    color: BaseColors.colorWhite,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icon_mycollection.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "我的收藏",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    color: BaseColors.colorWhite,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icon_mycollection.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "我的创建",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    color: BaseColors.colorWhite,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icon_mycollection.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "互动消息",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 8,
            ),
            SizedBox(
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                color: BaseColors.colorWhite,
                elevation: 0,
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/icon_notify.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        "公告通知",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notices()));
                },
              ),
            ),
            Container(
              height: 1,
            ),
            SizedBox(
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                color: BaseColors.colorWhite,
                elevation: 0,
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/icon_notify.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        "产品线",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
