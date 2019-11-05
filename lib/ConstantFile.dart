import 'dart:ui';
import 'package:flutter/material.dart';

final ScreenWidth = window.physicalSize.width;
final ScreenHeight = window.physicalSize.height;


double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}