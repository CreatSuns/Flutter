import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
import 'package:flutter_material/CustomWidget/ListPage.dart';
import 'package:flutter_material/Until/localFile.dart';
import 'package:flutter_material/commons/Network.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void homeData() {
    HttpQuerery.get(
      'material/agent-circle/get-list.json',
      data: {
        'circle_pass_id': 0,
        'pageSize': 10,
      },
      success: (data) {
        print('data===$data===');
      },
      error: (error) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    homeData();
    return Scaffold(
      body: FutureBuilder(
//        future: ,
//        initialData: ,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListPage(
            [
              'a',
              'b',
              'c',
            ],
            headerList: ['1'],
            itemWidgetCreator: (BuildContext context, int position) {
              return HomeCell(
                index: position,
              );
            },
            headerCreator: (BuildContext context, int position) {
              if (position == 0) {
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
              } else {
                return new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('$position -----header------- '),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class HomeCell extends StatefulWidget {
  HomeCell({
    Key key,
    this.index,
  }) : super(key: key);

  int index;

  @override
  _HomeCellState createState() => _HomeCellState();
}

class _HomeCellState extends State<HomeCell> {
  var imageWidth;
  var imageArr;

  bool isOpen = false;

  Widget titleContainer() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Image.asset('images/icon_person_placehold.png'),
              onPressed: () {},
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.index} ---Row---',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.5),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '二级代理',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '级别',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Text(
            '${DateTime.now()}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

  Widget contentContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 63, right: 50, top: 11.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '这是一段文字，随便写的，复制就好。'
            '这是一段文字，随便写的，复制就好。'
            '这是一段文字，随便写的，复制就好。'
            '这是一段文字，随便写的，复制就好。',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: isOpen == true ? null : 2,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 0),
              onPressed: () {
                setState(() {
                  print(isOpen);
                  isOpen = !isOpen;
                });
              },
              child: Text(isOpen == true ? '收起' : '全文'),
            ),
          ),
        ],
      ),
    );
  }

  Widget imagesContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 50, top: 20, bottom: 10),
      child: Wrap(
        spacing: 5,
        children: imageArr,
      ),
    );
  }

  Widget actionContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ButtonTheme(
                minWidth: 40,
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/icon_forward.png',
                    width: 10,
                  ),
                  label: Text(
                    '转发',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  textColor: Colors.black,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              ButtonTheme(
                minWidth: 40,
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/icon_dianzan.png',
                    width: 10,
                  ),
                  label: Text(
                    '点赞',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  textColor: Colors.black,
//              color: Colors.red,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
          )
        ],
      ),
    );
  }

  void initData(BuildContext context) {
    var width = getScreenWidth(context);
    print(width);
    imageWidth = (width - 130) / 3;
    print(imageWidth);
    imageArr = <Widget>[
      SizedBox(
        width: imageWidth,
        height: imageWidth,
        child: Image(
          image: AssetImage('images/home_1.png'),
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(
        width: imageWidth,
        height: imageWidth,
        child: Image(
          image: AssetImage('images/home_2.png'),
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(
        width: imageWidth,
        height: imageWidth,
        child: Image(
          image: AssetImage('images/home_3.png'),
          fit: BoxFit.fill,
        ),
      ),
    ];
  }

  Widget commentWidget(){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 300,
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('张三：aaa'),
          Text('李四：bbb'),
          Text('王五：¸ccc'),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            titleContainer(),
            contentContainer(),
            imagesContainer(),
            actionContainer(),
            commentWidget(),
          ],
        ));
  }
}
