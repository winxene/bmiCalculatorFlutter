//Here is a dart widget created for the male_or_female Slider
import 'package:flutter/material.dart';
import 'package:midexam/components/whitebox_widget.dart';

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

  //the button state for male or female
  bool _isChosenMale=true;
  bool _isChosenFemale=false;

  //setter for the button state
  _maleOrFemaleButton(bool isMale){
    setState(() {
      this.isMale=isMale;
      //save the value into the BMIData
      BMIData.isMale=isMale;
      //button highlight
      if(isMale){
      _isChosenMale=true;
      _isChosenFemale=false;
      }
      else{
        _isChosenMale=false;
        _isChosenFemale=true;
      }
    });
  }

  @override
  
  Widget genderButton(String genderLabel, bool isMale, bool isToggle) => Container(
    child: ElevatedButton(
      onPressed: () {
         _maleOrFemaleButton(isMale); //applying the button logic
      },
      child: Column(
        children: <Widget>[
          Icon(
            isMale?Icons.male
              :Icons.female, //will adapt based on the gender
            color: isToggle? Colors.white: Colors.black, //will transform when a button is being pressed
            ),
          Text(
            genderLabel,//will adapt based on the gender
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isToggle? Colors.white: Colors.black, //will transform when a button is being pressed
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

  Widget build(BuildContext context) => WhiteBoxWidget(
    //calling the WhiteBoxWidget that contains the container needed to be displayed on the screen
    height: (ScreenSpecs.screenHeight(context)-ScreenSpecs.screenPadTop(context) 
      - ScreenSpecs.screenPadBottom(context)) *0.25, 
    padding: const EdgeInsets.all(10),
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