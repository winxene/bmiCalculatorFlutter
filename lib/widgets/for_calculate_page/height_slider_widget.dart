//Here is a dart widget created for the height_slider_widget
import 'package:flutter/material.dart';
import 'package:midexam/components/value_unit_text.dart';

//components
import '../../components/screen_specs.dart';
import '../../components/whitebox_widget.dart';
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
            'Choose Your Height',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ValueUnit(labelValue: labelValue, unit: ' cm'),
        ],
      ),
    ),
  );
  

  Widget build(BuildContext context) { 
    //predefine the data, to prevent error when the user immediately press the calculate button
    BMIData.height=heightInCM;
    //calling the WhiteBoxWidget that contains the container needed to be displayed on the screen
    return WhiteBoxWidget(
      height: (ScreenSpecs.screenHeight(context)-ScreenSpecs.screenPadTop(context) )*0.24, 
      padding:const EdgeInsets.all(20.0),
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
                  ),
                ),
                heightSideLabel(_maxHeightInCM),
              ],
            ),
      ],
    ),
  );
  }
}


