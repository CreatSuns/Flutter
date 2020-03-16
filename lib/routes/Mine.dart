import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('个人中心'),
          backgroundColor: BaseColors.colorTheme,
          elevation: 0,
          //去掉Appbar底部阴影
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Alarm",
              onPressed: () {
                print("Alarm");
              },
            ),
          ],
        ),
        body: Container(
          child: MineBody(),
        ),
      ),
    );
  }
}

class MineBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorTheme,
                    ),
                    width: double.infinity,
                    height: 120,
                  ),
                  Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorF6F6F6,
                    ),
                    width: double.infinity,
                    height: 80,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 12, top: 15),
                child: ClipRRect(
                  //圆角图片
                  borderRadius: BorderRadius.circular(8),

                  child: Container(
                    //分析 4
                    decoration: BoxDecoration(
                      color: BaseColors.colorWhite,
                    ),
                    width: double.infinity,
                    height: 166,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      //分析 3
                      backgroundImage:
                      new AssetImage('images/pic_dongtaitouxiang.png'),
                      radius: 40.0,
                    ),
                  ],
                ) ,
              ),
            ],
          ),
        ),
        RaisedButton(
          child: Text("下一页"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("主题色"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("异步UI"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("原始指针事件处理"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("自会组件"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("自绘圆形组件"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("文件操作"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("网络请求"),
          onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => HttpTestRoute()));
          },
        ),
      ],
    );
  }
}
