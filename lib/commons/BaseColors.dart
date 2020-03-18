import 'package:flutter/material.dart';

class BaseColors {
  ///主色调，按钮，特殊需要强调和突出的文字
  static Color colorTheme = Color.fromARGB(255,15, 136, 235);

  ///主色调渐变用色，个别按钮和状态，从colorBtnLeft变化到colorBtnRight
  static Color colorBtnLeft = Color.fromARGB(255, 251, 156, 51);
  static Color colorBtnRight = Color.fromARGB(255, 252, 191, 50);

  ///提示性文字，状态信息，按钮等
  static Color colorRed = Color.fromARGB(255, 226, 36, 39);

  ///功能性较强的文字，内页标题等
  static Color color333333 = Color.fromARGB(255, 51, 51, 51);

  ///正文，副标题以及可点击区域的主要文字和图标
  static Color color666666 = Color.fromARGB(255, 102, 102, 102);

  ///弱化信息，提示性文字信息，不可点击状态
  static Color color999999 = Color.fromARGB(255, 153, 153, 153);

  ///弱化信息，提示性文字信息
  static Color colorDDDDDD = Color.fromARGB(255, 221, 221, 221);

  ///背景区域划分，分割线
  static Color colorF6F6F8 = Color.fromARGB(255, 246, 246, 248);

  ///背景颜色
  static Color colorF6F6F6 = Color.fromARGB(255, 246, 246, 246);

  ///纯白色
  static Color colorWhite = Color.fromARGB(255, 255, 255, 255);

  ///纯黑色
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);

  ///分享商文字颜色
  static Color colorGray = Color.fromARGB(255, 159, 172, 194);

  ///公告通知全部标记文字颜色
  static Color color576B95 = Color.fromARGB(255, 87, 107, 149);
}
