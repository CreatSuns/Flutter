import 'package:flutter/material.dart';
import 'package:flutter_material/models/home_cover_image_entity.dart';
import 'package:flutter_material/models/home_model_entity.dart';
import 'package:flutter_material/models/home_network_query.dart';
import 'package:flutter_material/models/login_model_entity.dart';
import 'package:flutter_material/routes/home_cell.dart';

import 'package:tableview/tableview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeModelDataList> list;
  String coverImageStr;
  LoginModelDataAgent agent;

  void homeCover() async {
    LoginModelDataAgent model = await HomeNetworkQuery.getUserInfo();
    HomeCoverImageEntity entity = await HomeNetworkQuery.homeCoverImageQuery();
    setState(() {
      agent = model;
      coverImageStr = entity.data.coverImage;
    });
  }

  Future homeData() async {
    HomeModelEntity model = await HomeNetworkQuery.homeListDataQuery({
      "circle_pass_id": 0,
      'pageSize': 2,
    });
    return model.data.xList;
  }

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
              image: NetworkImage(coverImageStr),
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
            padding: EdgeInsets.only(left: 280, top: 150),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: SizedBox(
                width: 80,
                height: 80,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Image.network(
                    agent.agentAvatar,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCover();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    homeCover();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        body: FutureBuilder(
          future: homeData(),
//        initialData: ,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('数据有误');
              } else {
                list = snapshot.data;
                return TableView(
                  tableHeaderView: tableHeaderView(),
                  sectionNumber: 1,
                  numberRowOfSection: (BuildContext context, int index) {
                    return list.length;
                  },
                  rowView: (BuildContext context, int section, int row) {
                    return HomeCell(
                      index: row,
                      data: list[row],
                    );
                  },
                );
              }
            } else {
              return Center(
                child: Text('等待网络'),
              );
            }
          },
        ),
      ),
    );
  }
}
