import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_material/routes/home/Home.dart';
import 'package:flutter_material/routes/material/Material.dart';
import 'package:flutter_material/routes/mine/Mine.dart';
import 'package:flutter_material/routes/home/SendDynamic.dart';
import 'package:flutter_material/routes/home/UserAgentRoute.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int currentIndex = 0;
  var _body;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void initData() {
    _body = IndexedStack(
      children: <Widget>[Home(), MaterialWidget(), Mine()],
      index: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      routes: {
        'sendDynamic':(context) => SendDynamic(),
        'userAgent':(context) => UserAgentRoute(ModalRoute.of(context).settings.arguments),
      },
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('images/icon_shouye.png')),
              activeIcon: Image(
                image: AssetImage('images/icon_shouye_press.png'),
              ),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('images/icon_sucai.png')),
              activeIcon:
                  Image(image: AssetImage('images/icon_sucai_press.png')),
              title: Text('素材'),
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('images/icon_me.png')),
              activeIcon: Image(image: AssetImage('images/icon_me_press.png')),
              title: Text('我的'),
            ),
          ],
          onTap: changeIndex,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
//        elevation: 10.0,
//        type: BottomNavigationBarType.fixed,
//      fixedColor: Colors.red,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 20,
        ),
        body: _body,
      ),
    );
  }
}
