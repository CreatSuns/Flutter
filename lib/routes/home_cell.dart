import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
import 'package:flutter_material/CustomWidget/ImagePreview.dart';
import 'package:flutter_material/models/home_model_entity.dart';

class HomeCell extends StatefulWidget {
  HomeCell({
    Key key,
    this.index,
    this.data,
  }) : super(key: key);

  int index;
  HomeModelDataList data;

  @override
  _HomeCellState createState() => _HomeCellState();
}

class _HomeCellState extends State<HomeCell> {
  var imageWidth;
  var imageArr;
  GlobalKey contentKey = GlobalKey();
  bool isOpen = false;

  double getContentHeight(){
    RenderObject renderObject = contentKey.currentContext.findRenderObject();
    print("semanticBounds:${renderObject.semanticBounds.size} paintBounds:${renderObject.paintBounds.size} size:${contentKey.currentContext.size}");
    final RenderBox box = contentKey.currentContext.findRenderObject();
    final size = box.size;
    print('size==${size}');
    final topLeftPosition = box.localToGlobal(Offset.zero);
    print('topLeftPosition==${topLeftPosition}');
    return topLeftPosition.dy;
  }

  Widget titleContainer(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Image.network(
                widget.data.agentAvatar,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              onPressed: () {
                goUserRoute(context);
              },
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
                  '${widget.data.agentName}',
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
                        '${widget.data.agentLevelName}',
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
            '${widget.data.createTime}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

  Widget contentContainer() {
    Widget show(){
      getContentHeight();
      return SizedBox(
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
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 63, right: 50, top: 11.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${widget.data.content}',
            key: contentKey,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: isOpen == true ? null : 2,
          ),
        ],
      ),
    );
  }

  Widget imagesContainer(BuildContext context) {

    List<Widget> widgets = [];
    widget.data.image.forEach((element) {
      widgets.add(GestureDetector(
        onTap: () {
          changeRoute(context);
        },
        child: SizedBox(
          width: imageWidth,
          height: imageWidth,
          child: Image(
            image: NetworkImage(element as String),
            fit: BoxFit.fill,
          ),
        ),
      ),);
    });

    return Padding(
      padding: EdgeInsets.only(left: 69, right: 50, top: 20, bottom: 10),
      child: Wrap(
        spacing: 5,
        children: widgets,
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
                    '${widget.data.pointNum}',
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

  Widget commentWidget() {
    List<Widget> widgets = [];
    widget.data.comment.forEach((element) {
      widgets.add(Text('${element.agentName}: ${element.content}'));
    });
    return Container(
        margin: EdgeInsets.only(bottom: 10, left: 69),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 330,
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var width = getScreenWidth(context);
    imageWidth = (width - 130) / 3;
    List<Widget> widgets = [titleContainer(context),
      contentContainer(),actionContainer(),
      commentWidget(),];
    if (widget.data.image.length > 0) {
      widgets.insert(2, imagesContainer(context));
    }
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ));
  }

  void changeRoute(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ImagePreviewPage(
        initialIndex: 0,
        items: ['images/home_1.png', 'images/home_2.png', 'images/home_3.png'],
      );
    }));
  }

  void goUserRoute(BuildContext context) {
    Navigator.of(context).pushNamed('userAgent');
  }
}
