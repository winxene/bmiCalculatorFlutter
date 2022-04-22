//will be created soon to make the code looks cleaner
//used for creating a neater value and unit indicator

import 'package:flutter/material.dart';

//to use the keyboard
import 'package:flutter/services.dart';

class ValueUnit extends StatefulWidget {

  final double labelValue;
  final String unit;
  @override
  
  ValueUnit({
    required this.labelValue, 
    required this.unit
  });
  State createState() => _ValueUnit();
}

class _ValueUnit extends State <ValueUnit>{

  Widget build (BuildContext context){
    var labelValue= ValueUnit(
      labelValue: widget.labelValue,
      unit: widget.unit,
    );
    return Container (
      //make the text become clickable, to allow manual input
      child: TextButton(
        onPressed: (){
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))]
            
          );
        },
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
      )
    );
  }
}