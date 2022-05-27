//template for whitebox_widget

import 'package:flutter/material.dart';

//Stateful widget is very important since this widget will be used in many interactable pages
class WhiteBoxWidget extends StatefulWidget {

  final double height;
  final  dynamic child;
  final dynamic padding;

  @override
    WhiteBoxWidget({
      required this.height,
      required this.child,
      required this.padding,
    });  //constructor
  State createState() => _WhiteBoxWidgetState();
}

class _WhiteBoxWidgetState extends State <WhiteBoxWidget> { 

  
  Widget build (BuildContext context){
    var insertInfo = WhiteBoxWidget(
      height: widget.height, 
      child: widget.child, 
      padding: widget.padding);

    return Container(
      height: insertInfo.height,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: insertInfo.padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        //creating the shadow effect
         boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of the shadow
              spreadRadius: 5, //extend the shadow
              blurRadius: 7, //blur the shadow
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      child: insertInfo.child,
    );
  }
}