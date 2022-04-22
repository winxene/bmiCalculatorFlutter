import 'package:flutter/material.dart';

//This is used for specifying screen
//Static method is very useful when you want to call a method directly without creating an object instance via constructor
class ScreenSpecs {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double screenPadTop(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }
  static double screenPadBottom(BuildContext context){
    return MediaQuery.of(context).padding.bottom;
  }
  static double screenPadLeft(BuildContext context){
    return MediaQuery.of(context).padding.left;
  }
  static double screenPadRight(BuildContext context){
    return MediaQuery.of(context).padding.right;
  }
}