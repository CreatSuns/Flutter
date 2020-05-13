import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';
import 'package:flutter_material/models/home/home_network_query.dart';
import 'package:flutter_material/models/login/login_model_entity.dart';
import 'package:tableview/tableview.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int selectIndex = 0;
  List<LoginModelDataAgent> agents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    userInfo();
  }

  LoginModelDataAgent agent;

  void userInfo() async {
    List<LoginModelDataAgent> models = await HomeNetworkQuery.getAgentsInfo();
    LoginModelDataAgent model = await HomeNetworkQuery.getUserInfo();
    int index = await HomeNetworkQuery.getSelectIndex(models);
    setState(() {
      agent = model;
      agents = models;
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '设置',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: BaseColors.color333333,
        leading: IconButton(
          icon: Image.asset("images/icon_back_white.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: BaseColors.colorWhite,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "头像",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Image.network(
                          agent.agentAvatar,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(left: 12),
          ),
          SizedBox(
            height: 70,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: BaseColors.colorWhite,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "昵称",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      agent.agentName,
                      style: TextStyle(
                          fontSize: 14, color: BaseColors.color333333),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(left: 12),
          ),
          SizedBox(
            height: 70,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: BaseColors.colorWhite,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "手机号",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      agent.agentMobile,
                      style: TextStyle(
                          fontSize: 14, color: BaseColors.color333333),
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
          Expanded(
            child: TableView(
              sectionNumber: 1,
              numberRowOfSection: (BuildContext context, int index) {
                return agents.length;
              },
              rowView: (BuildContext context, int section, int row) {
                LoginModelDataAgent agent = agents[row];
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Image.network(
                                agent.agentAvatar,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          agent.productLineName,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          agent.companyName,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        trailing: selectIndex == row
                            ? Text("当前状态")
                            : Text(
                                "切换团队",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
//                                  Image.asset(
//                                    'images/icon_huizhang.png',
//                                    width: 20,
//                                  ),
                              ),
                        onTap: () {
                          print('点击');
                          setState(() {
                            selectIndex = row;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                          color: Colors.black12,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
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
      ),
    );
  }
}
