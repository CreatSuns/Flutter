import 'package:flutter/material.dart';
import 'package:flutter_material/CustomWidget/FlexText.dart';
import 'package:flutter_material/CustomWidget/button.dart';
import 'package:flutter_material/commons/callback.dart';
import 'package:flutter_material/models/home/home_model_entity.dart';

class HomeSectionFoot extends StatefulWidget {

  HomeSectionFoot(this.list,{this.moreComment});

  List<HomeModelDataListCommant> list;
  NoParamsAndReturnCallback moreComment;
  @override
  _HomeSectionFootState createState() => _HomeSectionFootState();
}

class _HomeSectionFootState extends State<HomeSectionFoot> {

  List<Widget> comments(){
    List<Widget> widgets = [];
    int index = 0;
    bool needMore = false;
    if (widget.list.length > 2) {
      index = 2;
      needMore = true;
    } else {
      index = widget.list.length;
    }
    for (int i = 0; i < index; i++) {
      HomeModelDataListCommant element = widget.list[i];
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
    }

    if (needMore == true) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Button(
            height: 24.0,
            align: ButtonAlign.bottom,
            boxDecorationCallback: (select) {
              return BoxDecoration();
            },
            titleCallback: (state){
              return Text('更多评论', style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),);
            },
            tapCallback: (select){
              widget.moreComment();
            },
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
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
            children: comments(),
          ),
        ),
      ),
    );
  }
}
