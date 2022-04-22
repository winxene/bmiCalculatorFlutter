import 'dart:ui'; //to use superscript
import 'package:flutter/material.dart';

import '../../components/screen_specs.dart';


class ResultBox extends StatelessWidget{
  
  String classification;//the classification of the BMI
  double bmiValue;
  String message;
  ResultBox({required this.classification, required this.bmiValue, required this.message}); //constructor

  @override
    //widget to display the result.
    Widget _bmiResult(double labelValue)=> Container ( 
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Text(
          labelValue.toStringAsFixed(2), //to show only 2 decimal places
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          ' kg/m',
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
        const Text(
          '2',
          style: TextStyle(
            fontFeatures: [FontFeature.superscripts()],
            color: Colors.black,
          ),
        ),
      ],
    ),
  );

  //the complete widget
  Widget build(BuildContext context) 
  => Container( 
    height:(ScreenSpecs.screenHeight(context)-ScreenSpecs.screenPadTop(context)) *0.3,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          classification,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          'BMI Value',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(child:_bmiResult(bmiValue),),
        const SizedBox(height: 20,),
        Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
