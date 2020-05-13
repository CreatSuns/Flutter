import 'package:flutter/material.dart';
import 'package:flutter_material/CustomWidget/button.dart';

class HomeNavbar extends StatefulWidget {
  HomeNavbar(
      {@required this.top,
      this.alpha = 1.0,
      this.canRelease = false});

  double top;
  double alpha;
  bool canRelease;

  @override
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  Widget rows() {
    List<Widget> list = [];
    list.add(Text('                 '));
    list.add(
      Text(
        '首页',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    );
    if (widget.canRelease == true) {
      list.add(
        Button(
          width: 60.0,
          height: 30.0,
          boxDecorationCallback: (state) {
            return BoxDecoration();
          },
          titleCallback: (state) {
            return Text('发布');
          },
          tapCallback: (select) {},
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: SizedBox(
        height: 44.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.alpha,
      child: Container(
        color: Colors.white,
        height: widget.top + 44.0,
        child: rows(),
      ),
    );
  }
}
