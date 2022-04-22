//Here is a dart widget created for the height_slider_widget
import 'package:flutter/material.dart';
import 'package:midexam/components/value_unit_text.dart';

import '../../components/screen_specs.dart';

//models
import '../../models/bmi_data.dart';

class HeightSliderWidget extends StatefulWidget {
  
  @override
  State<HeightSliderWidget>createState() => _HeightSliderWidgetState();
}

class _HeightSliderWidgetState extends State<HeightSliderWidget> {
  static double heightInCM = 150.0;
  final _minHeightInCM=100.0, _maxHeightInCM=200.0;

  @override
  //this is the method used to create labels for the slider
  Widget heightSideLabel(double labelValue)=> Container (
    child: Text(
      labelValue.toStringAsFixed(0),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  
  Widget currentHeightLabel(double labelValue)=> Container (
    child: Center(
      child: Column(
        children: <Widget> [
          const Text(
            'Height',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ValueUnit(labelValue: labelValue, unit: ' cm'),
        ],
      ),
    ),
  );

  Widget build(BuildContext context) { 
    //predefine the data, to prevent error when the user immediately press the calculate button
    BMIData.height=heightInCM;
    return Container(
        height:(ScreenSpecs.screenHeight(context)-ScreenSpecs.screenPadTop(context) )*0.24,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(20.0),
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
        child: Column(
          children: [
            currentHeightLabel(heightInCM),
            Row(
              children: <Widget>[
                heightSideLabel(_minHeightInCM),
                Expanded(
                  child: Slider.adaptive( // Slider.adaptive is a widget that adapts to both iOS and Android
                    value: heightInCM, // default value
                    min: _minHeightInCM, // in cm
                    max: _maxHeightInCM, // in cm
                    onChanged: (double newValue) { // newValue is the new value of the slider
                      setState(() {heightInCM = newValue; 
                      BMIData.height = heightInCM.roundToDouble(); //to prevent decimal values
                      }); // setState is used to update the state of the widget
                    },
                    // label: _heightInCM.round().toString(), // label is the text that appears on the slider
                  ),
                ),
                heightSideLabel(_maxHeightInCM),
              ],
            ),
      ],
    )
  );
} 
}


