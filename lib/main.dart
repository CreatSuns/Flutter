import 'package:flutter/material.dart';
import 'package:flutter_material/routes/login/ChooseProductLine.dart';
import 'package:flutter_material/routes/login/login.dart';
import 'package:flutter_material/routes/login/user_procotol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      debugShowMaterialGrid: true,
//      showPerformanceOverlay: true,
//      checkerboardRasterCacheImages: true,
//      checkerboardOffscreenLayers: true,
//      showSemanticsDebugger: true,
//      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login' : (context) => Login(),
        'productLine' : (context) => ChooseProductLine(ModalRoute.of(context).settings.arguments),
        'userProcotol' : (context) => UserProcotol(),
      },
      home: Login(),
    );
  }
}