import 'package:flutter/material.dart';
import 'package:flutter_material/models/home/home_comment_model_entity.dart';
import 'package:flutter_material/models/home/home_model_entity.dart';
import 'package:flutter_material/models/home/home_network_query.dart';
import 'package:flutter_material/widgets/home/home_cell.dart';
import 'package:tableview/tableview.dart';

class UserAgentRoute extends StatefulWidget {
  HomeModelDataList modelDataList;

  UserAgentRoute(this.modelDataList);

  @override
  _UserAgentRouteState createState() => _UserAgentRouteState();
}

class _UserAgentRouteState extends State<UserAgentRoute> {
  List<HomeCommantModelDataList> models;

  void getData() async {
    HomeCommentModelEntity modelEntity =
        await HomeNetworkQuery.homeCommentQuery({
      'circle_id': widget.modelDataList.circleId,
      'page': 1,
      'pageSize': 10,
    });
    setState(() {
      models = modelEntity.data.xList;
    });
  }

  List<Widget> comment() {
    List<Widget> list = [];
    models.forEach((element) {
      list.add(Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: element.agentAvatar != null
                      ? Image.network(
                          element.agentAvatar,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        )
                      : null,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(element.agentName),
                          Text(element.createTime),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          element.content,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            indent: 10,
          )
        ],
      ));
    });
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: TableView(
        tableHeaderView: HomeCell(
          index: 0,
          data: widget.modelDataList,
          callback: () {},
        ),
        sectionNumber: 1,
        numberRowOfSection: (BuildContext context, int index) {
          return 1;
        },
        rowView: (BuildContext context, int section, int row) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: comment(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
