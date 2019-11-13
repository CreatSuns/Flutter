
import 'package:flutter/material.dart';
import 'package:flutter_material/models/login_entity.dart';
import 'package:flutter_material/routes/RootWidget.dart';

class ChooseProductLine extends StatefulWidget {
  ChooseProductLine(this.agents, {
    Key key,
  }) : super(key : key);
  
  List<LoginDataAgent> agents;
  
  @override
  _ChooseProductLineState createState() => _ChooseProductLineState();
}

class _ChooseProductLineState extends State<ChooseProductLine> {

  int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择产品线'),
      ),
      body: ListView.builder(
        itemCount: widget.agents.length,
          itemBuilder: (BuildContext context, int index) {
          LoginDataAgent agent = widget.agents[index];
              return ListTile(
                leading: Image.network(agent.agentAvatar),
                title: Text(agent.agentName),
                subtitle: Text(agent.companyName),
                trailing: selectIndex == index ? Checkbox(value: true, onChanged: null) : null,
                onTap: () {
                  setState(() {
                    selectIndex = index;
                  });
                  Future.delayed(Duration(seconds: 1),(){
                    runApp(RootWidget());
                  });
                },
              );
          },
      ),
    );
  }
}
