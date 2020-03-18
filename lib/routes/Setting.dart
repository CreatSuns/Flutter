import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '设置',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: BaseColors.colorWhite,
        leading: IconButton(
          icon: Image.asset("images/icon_back.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SettingBody(),
    );
  }
}

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "账号管理",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                CircleAvatar(
                  //分析 3
                  backgroundImage:
                      new AssetImage('images/pic_dongtaitouxiang.png'),
                  radius: 16.0,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "视频自动播放",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "仅WIFI",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "推送消息",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 1,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "清除缓存",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "20M",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "关于我们",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: BaseColors.colorWhite,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "退出登录",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
