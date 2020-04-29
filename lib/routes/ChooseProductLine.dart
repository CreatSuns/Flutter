import 'package:flutter/material.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/models/login_model_entity.dart';
import 'package:flutter_material/models/login_network_query.dart';
import 'package:flutter_material/routes/RootWidget.dart';

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
      body: ListView.builder(
        itemCount: widget.agents.length,
        itemBuilder: (BuildContext context, int index) {
          LoginModelDataAgent agent = widget.agents[index];
          return ListTile(
            leading: Image.network(agent.agentAvatar),
            title: Text(agent.productLineName),
            subtitle: Text(agent.companyName),
            trailing: selectIndex == index
                ? Checkbox(value: true, onChanged: null)
                : null,
            onTap: () {
              setState(() {
                selectIndex = index;
              });
              login();
            },
          );
        },
      ),
    );
  }
}
