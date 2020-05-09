import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FlexText extends StatefulWidget {
  FlexText({
    Key key,
    this.text,
    this.maxLines,
    this.style,
    this.expand = false,
  }) : super(key: key);

  String text;
  int maxLines;
  TextStyle style;
  bool expand;

  @override
  State<StatefulWidget> createState() {
    return _FlexTextState();
  }
}

class _FlexTextState extends State<FlexText> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: widget.text ?? '', style: widget.style);
      final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr);

      tp.layout(maxWidth: size.maxWidth);
      if (tp.didExceedMaxLines) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.expand
                ? Text(widget.text ?? '', style: widget.style)
                : Text(widget.text ?? '',
                    maxLines: widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: widget.style),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  widget.expand = !widget.expand;
                });
              },
              child: Container(
                padding: EdgeInsets.only(top: 2),
                child: Text(widget.expand ? '收起' : '全文',
                    style: TextStyle(
                        fontSize:
                            widget.style != null ? widget.style.fontSize : null,
                        color: Colors.blue)),
              ),
            ),
          ],
        );
      } else {
        return Text(widget.text ?? '', style: widget.style);
      }
    });
  }
}

class SuffixFlexText extends StatefulWidget {
  SuffixFlexText({
    Key key,
    this.textList,
    this.maxLines,
    this.style,
    this.expand = false,
    this.textSpan,
  }) : super(key: key);

  List<String> textList;
  int maxLines;
  TextStyle style;
  bool expand;
  TextSpan textSpan;

  @override
  _SuffixFlexTextState createState() => _SuffixFlexTextState();
}

class _SuffixFlexTextState extends State<SuffixFlexText> {
  TextSpan textS;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textS = widget.textSpan;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(children: [
        widget.textSpan,
        TextSpan(text: '...展开', style: TextStyle(color: Colors.blue))
      ]);
      final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);
//      print('tp.didExceedMaxLines==${tp.didExceedMaxLines}');
      if (tp.didExceedMaxLines) {
        var startIndex = 0;
        for (int count = 0; count < widget.maxLines; count++) {
          TextRange range =
              tp.getLineBoundary(TextPosition(offset: startIndex));
//          print(range.start.toString() + ":" + range.end.toString());
          startIndex = range.end + 1;
        }
//        print('end==${startIndex}');
        var otherCount = 0;
        for (int a = 0; a < widget.textList.length - 1; a++) {
          String text = widget.textList[a];
          otherCount += text.length;
        }
        String result =
            widget.textList.last.substring(0, startIndex - otherCount - 4);
//        print("string==" + result);
        if (widget.textSpan.children != null && widget.textSpan.children.length > 0) {
          List<InlineSpan> spanList = [];
          widget.textSpan.children.forEach((element) {
            spanList.add(element);
          });
          textS = TextSpan(
            children: spanList,
          );
          textS.children.replaceRange(
              textS.children.length - 1,
              textS.children.length,
              [TextSpan(text: result, style: widget.style)]);
        } else {
          textS = TextSpan(
            text: result,
            style: widget.textSpan.style,
            recognizer: widget.textSpan.recognizer,
          );
        }
        TapGestureRecognizer tap = TapGestureRecognizer();
        tap.onTap = () {
          setState(() {
            widget.expand = !widget.expand;
          });
        };
//        print('width.expand==${widget.expand}');
        return widget.expand == false
            ? Text.rich(
          TextSpan(children: [
            textS,
            TextSpan(
                text: '...展开',
                style: TextStyle(color: Colors.blue),
                recognizer: tap),
          ]),
          maxLines: widget.maxLines,
        )
            : Text.rich(
          TextSpan(children: [
            widget.textSpan,
            TextSpan(
                text: ' 收起',
                style: TextStyle(color: Colors.blue),
                recognizer: tap),
          ]),
        );
      } else {
        return Text.rich(widget.textSpan);
      }
    });
  }
}
