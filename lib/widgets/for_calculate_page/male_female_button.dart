//Here is a dart widget created for the male_or_female Slider
import 'package:flutter/material.dart';

//import screen_specs.dart
import '../../components/screen_specs.dart';

//import bmi_data
import '../../models/bmi_data.dart';

class MaleFemaleButton extends StatefulWidget {
  @override
  State<MaleFemaleButton>createState() => _MaleFemaleButtonState();
}

class _MaleFemaleButtonState extends State<MaleFemaleButton> {
  bool isMale=true; //key variable which will be passed to the bmi_calculator, also  to prevent error when the user immediately press the calculate button

  //the button state
  bool _isChosenMale=true;
  bool _isChosenFemale=false;

  //setter for the button state
  _maleOrFemaleButton(bool isMale){
    setState(() {
      this.isMale=isMale;
    });
  }
  //function to define male or female
  dynamic _MaleFemaleSwitch(bool isMale){
    if(isMale){
      _isChosenMale=true;
      _isChosenFemale=false;
    }
    else{
      _isChosenMale=false;
      _isChosenFemale=true;
    }
  }

  @override
  
  Widget genderButton(String genderLabel, bool isMale, bool isToggle) => Container(
    child: ElevatedButton(
      
      onPressed: () {
         _maleOrFemaleButton(isMale);
         setState(() {
            _MaleFemaleSwitch(isMale);
            //set value to bmi_data
             BMIData.isMale=isMale;
          });
      },
      child: Column(
        children: <Widget>[
          Icon(
            isMale?Icons.male
              :Icons.female,
            color: isToggle? Colors.white: Colors.black,
            ),
          Text(
            genderLabel,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isToggle? Colors.white: Colors.black,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40, 
          vertical: 40,
        ),
        //triggering the color of the chosen text
        primary: isToggle? Colors.teal : Colors.white,
      )
    ),
  );

  Widget build(BuildContext context) => Container(
    height:(ScreenSpecs.screenHeight(context)-ScreenSpecs.screenPadTop(context) 
      - ScreenSpecs.screenPadBottom(context)) *0.25,
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
    child: Center(
      child: Column(
        children: <Widget> [
          const Text(
            'Choose Your Gender',
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
            children: <Widget>[
              Expanded(
                child: 
                genderButton('Male', true, _isChosenMale),
              ), 
              //sizedbox is used for giving a small gap
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: 
              genderButton('Female', false, _isChosenFemale),
              ),  
            ],
          ),
        ],
      ),
    ),
  );
}