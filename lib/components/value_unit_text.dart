//will be created soon to make the code looks cleaner
//used for creating a neater value and unit indicator

import 'package:flutter/material.dart';


class ValueUnit extends StatefulWidget {

  final double labelValue;
  final String unit;
  @override
  
  ValueUnit({
    required this.labelValue, 
    required this.unit
  });//constructor

  State createState() => _ValueUnit();
}

class _ValueUnit extends State <ValueUnit>{

  Widget build (BuildContext context){
    var labelValue= ValueUnit(
      labelValue: widget.labelValue,
      unit: widget.unit,
    ); //create a new object to prevent error when the user immediately press the calculate button
    return Container (
      //make the text become clickable, to allow manual input
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            labelValue.labelValue.toStringAsFixed(0),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            labelValue.unit,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}