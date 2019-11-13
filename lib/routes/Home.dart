import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
import 'package:flutter_material/CustomWidget/ListPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(
        [
          ['a', 'b', 'c'],
          ['d', 'b', 'c'],
          ['a', 'b', 'c']
        ],
        headerList: [1],
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
      ),
//        CustomScrollView(
//          slivers: <Widget>[
//            SliverAppBar(
//              leading: null,
//              automaticallyImplyLeading: false,
//              title: Text('首页'),
//              expandedHeight: 200,
//              flexibleSpace: FlexibleSpaceBar(
//                background: Image(
//                  image: AssetImage('images/pic_shouyebackground.png'),
//                ),
//              ),
//            ),
//            SliverFixedExtentList(
//              delegate: SliverChildBuilderDelegate(
//                    (BuildContext context, int index){
//                  return HomeCell();
//                },
//              ),
//              itemExtent: 300,
//            ),
//          ],
//        )
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

  Widget titleContainer() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Image.asset('images/icon_person_placehold.png'),
          onPressed: null,
        ),
        Expanded(
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
              Text(
                '看上面',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ButtonTheme(
          minWidth: 50,
          child: FlatButton.icon(
            onPressed: () {},
            label: Text(
              '转发',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            icon: Image.asset('images/icon_zhuanfa.png'),
            textColor: Colors.black,
          ),
        )
      ],
    );
  }

  Widget contentContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Text(
        '这是一段文字，随便写的，复制就好。'
        '这是一段文字，随便写的，复制就好。'
        '这是一段文字，随便写的，复制就好。'
        '这是一段文字，随便写的，复制就好。',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
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
        children: <Widget>[
          Text(
            '2012-01-01',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          ButtonTheme(
            minWidth: 40,
            child: FlatButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'images/icon_pinglun.png',
                width: 10,
              ),
              label: Text(
                '评论',
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
          ButtonTheme(
            minWidth: 40,
            child: FlatButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'images/icon_collect.png',
                width: 10,
              ),
              label: Text(
                '收藏',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              textColor: Colors.black,
            ),
          ),
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
          ],
        ));
  }
}
