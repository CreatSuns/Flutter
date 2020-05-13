import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';
class MaterialCell extends StatefulWidget {
  @override
  _MaterialCellState createState() => _MaterialCellState();
}

class _MaterialCellState extends State<MaterialCell> {

  double imageWidth;

  @override
  Widget build(BuildContext context) {
    var width = getScreenWidth(context);
    imageWidth = (width - 130) / 3;
//    List<Widget> widgets = [
//      titleContainer(context),
//    ];
//    if (widget.data.content.length > 0) {
//      widgets.add(contentContainer());
//    }
//    if (widget.data.image.length > 0) {
//      widgets.add(imagesContainer(context));
//    }
//    widgets.add(actionContainer());
//    if (widget.data.comment.length > 0) {
//      widgets.add(commentWidget());
//    }

    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('data')],
        ));
  }
}
