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
  int selectIndex;

  void login() async {
    LoginModelDataAgent agent = widget.agents[selectIndex];
    await LoginNetWorkQuery.chooseProductLine({
      'admin_id': agent.adminId,
    });

    await LoginNetWorkQuery.saveModel(widget.agents);
    runApp(RootWidget());
//
//    HttpQuerery.post(
//      'material/account/set-admin-info.json',
//      data: ,
//      success: (data) {
//        runApp(RootWidget());
//      },
//      error: (errorString) {
//
//      }
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择产品线'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: TableView(
                sectionNumber: 1,
                numberRowOfSection: (BuildContext context, int index) {
                  return widget.agents.length;
                },
                rowView: (BuildContext context, int section, int row) {
                  LoginModelDataAgent agent = widget.agents[row];
                  return ListTile(
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
                        ? Checkbox(value: true, onChanged: null, checkColor: Colors.black,)
                        : null,
                    onTap: () {
                      print('点击');
                      setState(() {
                        selectIndex = row;
                      });
                    },
                  );
//                    Column(
//                    children: [
//
//                      Divider(
//                        color: Colors.black12,
//                      ),
//                    ],
//                  );
                },
              ),
            ),
            Container(
              color: Colors.black87,
              width: ScreenWidth,
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
