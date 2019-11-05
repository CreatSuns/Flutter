import 'package:flutter/material.dart';
import 'package:flutter_material/login/login.dart';

void main() => runApp(MyApp());

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
      home: Login(),
    );
  }
}