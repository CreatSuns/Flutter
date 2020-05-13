import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
import 'package:flutter_material/CustomWidget/FlexText.dart';
import 'package:flutter_material/CustomWidget/ImagePreview.dart';
import 'package:flutter_material/CustomWidget/button.dart';
import 'package:flutter_material/models/home_model_entity.dart';
import 'package:flutter_material/models/home_network_query.dart';

typedef CommentCallback = Function();

class HomeCell extends StatefulWidget {
  HomeCell({
    Key key,
    this.index,
    this.callback,
    this.data,
  }) : super(key: key);

  int index;
  CommentCallback callback;
  HomeModelDataList data;

  @override
  _HomeCellState createState() => _HomeCellState();
}

class _HomeCellState extends State<HomeCell> {
  var imageWidth;
  var imageArr;
  bool isOpen = false;

  Widget titleContainer(BuildContext context) {
//    print(widget.data.agentAvatar.toString());
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
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
//                  loadingBuilder: (BuildContext context,
//                      Widget child,
//                      ImageChunkEvent loadingProgress) {
//                    return CupertinoActivityIndicator(
//                      radius: 10,
//                    );
//                  },
                ),
                onPressed: () {
                  goUserRoute(context);
                },
              ),
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
                      Image.asset('images/icon_huizhang.png'),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '${widget.data.agentLevelName}',
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
        ButtonTheme(
          minWidth: 90,
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
      ],
    );
  }

  Widget contentContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 63, right: 50, top: 11.5),
      child: FlexText(
        text: '${widget.data.content}',
        maxLines: 2,
        style: TextStyle(fontSize: 15),
        expand: false,
      ),
    );
  }

  Widget imagesContainer(BuildContext context) {
    List<Widget> widgets = [];
    widget.data.image.forEach((element) {
      widgets.add(
        GestureDetector(
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
        ),
      );
    });

    return Padding(
      padding: EdgeInsets.only(left: 69, right: 50, top: 20, bottom: 10),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: widgets,
      ),
    );
  }

  Widget actionContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 65),
      child: Row(
        children: <Widget>[
          Text(
            '${widget.data.createTime}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Button(
            disable: false,
            width: 80.0,
            height: 44.0,
            direction: ButtonDirection.ltr,
            boxDecorationCallback: (state) {
              return BoxDecoration();
            },
            titleCallback: (state) {
              return Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('评论'),
              );
            },
            imageCallback: (state) {
              if (state == ButtonState.normal) {
                return Image.asset(
                  'images/icon_pinglun.png',
                );
              } else {
                return Image.asset(
                  'images/icon_collect.png',
                );
              }
            },
            tapCallback: (select){
              if (widget.callback != null) {
                widget.callback();
              }
            },
          ),
          Button(
            disable: false,
            select: widget.data.isCollect == 1 ? true : false,
            width: 80.0,
            direction: ButtonDirection.ltr,
            boxDecorationCallback: (state) {
              return BoxDecoration();
            },
            titleCallback: (state) {
              return Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('收藏'),
              );
            },
            imageCallback: (state) {
              if (state == ButtonState.normal) {
                return Image.asset(
                  'images/icon_collect.png',
                );
              } else if (state == ButtonState.select){
                return Image.asset(
                  'images/icon_collect_press.png',
                );
              } else {
                return null;
              }
            },
            tapCallback: (select) async {
              await HomeNetworkQuery.homeCollect({'circle_id': widget.data.circleId, 'is_collect': select.toString()});
            },
          ),
          Button(
            disable: false,
            select: widget.data.isPoint == 1 ? true : false,
            width: 80.0,
            direction: ButtonDirection.ltr,
            boxDecorationCallback: (state) {
              return BoxDecoration();
            },
            titleCallback: (state) {
              return Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(widget.data.pointNum.toString()),
              );
            },
            imageCallback: (state) {
//              print(state.toString());
              if (state == ButtonState.normal) {
                return Image.asset(
                  'images/icon_dianzan.png',
                );
              } else if (state == ButtonState.select){
                return Image.asset(
                  'images/icon_dianzan_press.png',
                );
              } else {
                return null;
              }
            },
            tapCallback: (select) async {
              await HomeNetworkQuery.homeLike({'circle_id': widget.data.circleId, 'is_point': select.toString()});
            },
          ),
        ],
      ),
    );
  }

  Widget commentWidget() {
    List<Widget> widgets = [];
    widget.data.comment.forEach((element) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: SuffixFlexText(
            textList: ['${element.agentName}:', element.content],
            maxLines: 2,
            style: TextStyle(fontSize: 14),
            textSpan: TextSpan(children: [
              TextSpan(
                  text: '${element.agentName}:',
                  style: TextStyle(fontSize: 14, color: Colors.black38)),
              TextSpan(text: element.content, style: TextStyle(fontSize: 14)),
            ]),
          ),
        ),
      );
    });
    return Padding(
      padding: EdgeInsets.only(left: 69, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 330,
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = getScreenWidth(context);
    imageWidth = (width - 130) / 3;
    List<Widget> widgets = [
      titleContainer(context),
    ];
    if (widget.data.content.length > 0) {
      widgets.add(contentContainer());
    }
    if (widget.data.image.length > 0) {
      widgets.add(imagesContainer(context));
    }
    widgets.add(actionContainer());
    if (widget.data.comment.length > 0) {
      widgets.add(commentWidget());
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
