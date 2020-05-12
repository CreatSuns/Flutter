import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';
import 'package:flutter_material/models/mine/notice_model_entity.dart';
import 'package:flutter_material/models/mine/notice_network_query.dart';
import 'package:toast/toast.dart';

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}

Future noticeData() async {
  NoticeModelEntity model = await NoticeNetworkQuery.noticeListQuery({
    "circle_pass_id": 0,
    'pageSize': 10,
  });
  CustomToast.cancelLoading();
  return model.data.xList;
}



class _NoticesState extends State<Notices> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '公告通知',
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
      body: NoticesBody(),
    );
  }
}

class NoticesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        NoticesList(),
        Column(
          children: <Widget>[
            Container(
              height: 1,
              color: BaseColors.colorF6F6F6,
            ),
            SizedBox(
              height: 50,
              child: Container(
                color: BaseColors.colorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        "全部标记已读",
                        style: TextStyle(
                            fontSize: 14, color: BaseColors.color576B95),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        "清空",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NoticesList extends StatelessWidget {
  List<NoticeModelEntityDataList> list;

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider = Divider(
      color: BaseColors.colorF6F6F6,
    );
    return FutureBuilder(
      future: noticeData(),
//        initialData: ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('数据有误');
          } else {
            list = snapshot.data;
            return ListView.separated(
              padding: const EdgeInsets.only(top: 50),
              itemCount: list.length,
              //列表项构造器
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    color: BaseColors.colorWhite,
                    elevation: 0,
                    child: Container(
                      color: BaseColors.colorWhite,
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/icon_notify.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              list[index].content,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => Notices()));
                    },
                  ),
                );
              },
              //分割器构造器
              separatorBuilder: (BuildContext context, int index) {
                return divider;
              },
            );
          }
        } else {
          showLoading();
          return Text("");
        }
      },
    );
  }

  void showLoading() {
    CustomToast.showLoading(
        msg: '加载数据中...', cancelable: true, canceledOnTouchOutside: true);
  }

  void showFail() {
    CustomToast.showLoading(
        cancelable: true, canceledOnTouchOutside: true, status: -1);
  }
}
