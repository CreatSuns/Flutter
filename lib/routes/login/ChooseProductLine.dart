import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/models/login_model_entity.dart';
import 'package:flutter_material/models/login_network_query.dart';
import 'package:flutter_material/routes/RootWidget.dart';
import 'package:tableview/tableview.dart';

class ChooseProductLine extends StatefulWidget {
  ChooseProductLine(
    this.agents, {
    Key key,
  }) : super(key: key);

  List<LoginModelDataAgent> agents;

  @override
  _ChooseProductLineState createState() => _ChooseProductLineState();
}

class _ChooseProductLineState extends State<ChooseProductLine> {
  int selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.agents.first.isSelect = true;
  }

  void login() async {
    LoginModelDataAgent agent = widget.agents[selectIndex];
    widget.agents.forEach((element) {
      if (element == agent) {
        agent.isSelect = true;
      } else {
        element.isSelect = false;
      }
    });
    await LoginNetWorkQuery.chooseProductLine({
      'admin_id': agent.adminId,
    });

    await LoginNetWorkQuery.saveModel(widget.agents);
    runApp(RootWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('产品线'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Text(
                '请选择产品线',
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
            ),
            Expanded(
              child: TableView(
                sectionNumber: 1,
                numberRowOfSection: (BuildContext context, int index) {
                  return widget.agents.length;
                },
                rowView: (BuildContext context, int section, int row) {
                  LoginModelDataAgent agent = widget.agents[row];
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.network(agent.agentAvatar),
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
                            ? Checkbox(
                                value: true,
                                onChanged: null,
                                checkColor: Colors.black,
                              )
                            : null,
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
                  );
                },
              ),
            ),
            Container(
              color: Colors.black87,
              width: PhoneWidth,
              height: 80.0,
              child: FlatButton(
                onPressed: login,
                child: Text(
                  '立即进入',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
