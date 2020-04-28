import 'package:flutter/material.dart';
import 'package:tableview/tableview.dart';

class UserAgentRoute extends StatefulWidget {
  @override
  _UserAgentRouteState createState() => _UserAgentRouteState();
}

class _UserAgentRouteState extends State<UserAgentRoute> {
  Widget tableHeaderView() {
    return SizedBox(
      height: 260,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          SizedBox(
            height: 260,
            child: Image(
              image: AssetImage('images/icon_bg_white.png'),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image(
              image: AssetImage('images/pic_shouyebackground.png'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              '首页',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 250, top: 150),
            child: IconButton(
              iconSize: 80,
              icon: Image.asset(
                'images/pic_dongtaitouxiang.png',
                fit: BoxFit.fill,
                width: 80,
                height: 80,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionHeaderView() {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.blue,
          ),
          width: 100,
          height: 30,
          child: Text(
            '2020时光轴',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableView(
        tableHeaderView: Text('aaa'),
        tableFooterView: Text('bbb'),
        sectionNumber: 20,
        numberRowOfSection: (BuildContext context, int index) {
          return 5;
        },
        rowView: (BuildContext context, int section, int row) {
          return Text('这个是第${section}区，第${row}行');
        },
        sectionHeaderView: (BuildContext context, int index) {
          return Text('这个是第${index}区头');
        },
        sectionFooterView: (BuildContext context, int index) {
          return Text('这个是第${index}区尾');
        },
      ),
    );
  }
}
