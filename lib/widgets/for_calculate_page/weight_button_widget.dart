//Here is a dart widget created for the height_slider_widget
import 'package:flutter/material.dart';
import 'dart:async'; //for the timer
//components
import 'package:midexam/components/value_unit_text.dart';
import 'package:midexam/components/whitebox_widget.dart';
  //import screen_specs
import '../../components/screen_specs.dart';
//import bmi_data.dart
import '../../models/bmi_data.dart';

class WeightButtonWidget extends StatefulWidget {
  @override
  State<WeightButtonWidget>createState() => _WeightButtonWidget();
}

class _WeightButtonWidget extends State<WeightButtonWidget> {
  double weightInKg = 50;
  //ternary for setup the long press timer
  Timer? _timer;
  //the boolean for the long press
  bool _noLongPressed= false;
  //timer to stop the rapid mode when long press

  //arrow function, the anonymous function
  void _cancelRepeat()=> _timer!=null 
  ? _timer!.cancel() 
  : _noLongPressed = true;

  //function to increase/ decrease weight value
  void _adjustWeightValue(bool isIncrease)=> setState(() {
    isIncrease? weightInKg++ : weightInKg--; //if it is increase, increase the value, else decrease
    BMIData.weight=weightInKg;
  });

  @override
  
  Widget setWeightValueButton(double labelValue, bool isIncrease) => Container(
    child: 
    //GestureDetector is used to detect the long press
    GestureDetector(
      child:
        TextButton(
          onPressed: () {
            _adjustWeightValue(isIncrease);
          },
          child: Column(
            children: <Widget>[
              Text(
                //will automatically display the symbol based on the boolean
                isIncrease? '+' : '-',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5, 
              vertical: 5,
            ),
          )
        ),    
        //When the long press is triggered
        onLongPressStart: (details) {
          //duration of the long press
          _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
            _adjustWeightValue(isIncrease);
          });
        },
        onLongPressEnd: (details) {
          _cancelRepeat();
        },
    ),
    
  );

  Widget build(BuildContext context) {
    //predefine the data, to prevent error when the user immediately press the calculate button
    BMIData.weight=weightInKg;
    //calling the WhiteBoxWidget that contains the container needed to be displayed on the screen
    return WhiteBoxWidget(
    height: (ScreenSpecs.screenHeight(context) - ScreenSpecs.screenPadTop(context)) *0.2, 
    padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Choose Your Weight',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              setWeightValueButton(weightInKg, false),
              ValueUnit(labelValue: weightInKg, unit: ' kg'),
              setWeightValueButton(weightInKg, true),
            ],
          ),
        ],
      ),
    );
  }
}