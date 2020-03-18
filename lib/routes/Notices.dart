import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
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
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider = Divider(
      color: BaseColors.colorF6F6F6,
    );
    return ListView.separated(
      padding: const EdgeInsets.only(top: 50),
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
                      "公告通知内容公告通知内容公告通知内容",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Notices()));
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
}
