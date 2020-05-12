import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';
import 'package:flutter_material/models/home_network_query.dart';
import 'package:flutter_material/models/login_model_entity.dart';
import 'package:toast/toast.dart';

import 'Notices.dart';
import 'Setting.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo();
  }

  LoginModelDataAgent agent;

  void userInfo() async {
    LoginModelDataAgent model = await HomeNetworkQuery.getUserInfo();
    setState(() {
      agent = model;
    });
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    userInfo();
  }

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: BaseColors.colorTheme,
                        ),
                        width: double.infinity,
                        height: 145,
                      ),
                      Container(
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
                        left: 12, right: 12, bottom: 12, top: 115),
                    child: ClipRRect(
                      //圆角图片
                      borderRadius: BorderRadius.circular(8),

                      child: Container(
                        decoration: BoxDecoration(
                          color: BaseColors.colorWhite,
                        ),
                        width: double.infinity,
                        height: 120,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: CircleAvatar(
                            //分析 3
                            backgroundImage: NetworkImage(agent.agentAvatar),
                            radius: 50.0,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            agent.agentName,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Image.asset(
                                'images/icon_huizhang.png',
                                width: 20,
                              ),
                            ),
                            Text(
                              agent.agentLevelName,
                              style: TextStyle(
                                  fontSize: 12, color: BaseColors.colorE7C083),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 0),
                  child: ClipRRect(
                    //圆角图片
                    borderRadius: BorderRadius.circular(8),

                    child: Container(
                      //分析 4
                      decoration: BoxDecoration(
                        color: BaseColors.colorWhite,
                      ),
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 0),
                  child: SizedBox(
                    height: 120,
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8))),
                              color: BaseColors.colorWhite,
                              elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image:
                                        AssetImage('images/icon_favorite.png'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "我的收藏",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
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
                                    image:
                                        AssetImage('images/icon_create.png'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "我的创建",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                CustomToast.showLoading(msg: '正在登陆...');
                              },
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              color: BaseColors.colorWhite,
                              elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image:
                                        AssetImage('images/icon_inform.png'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "公告通知",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Notices()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
