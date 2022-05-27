import 'package:flutter/material.dart';
import 'package:midexam/widgets/for_result_page/result_box_widget.dart';

//components
import '../components/rounded_button.dart';
import '../components/screen_specs.dart';

import '../widgets/change_theme_button.dart';

import 'calculate_page.dart';

//models
import '../models/bmi_data.dart';
import '../models/bmi_calculator.dart';

class ResultPage extends StatelessWidget {
  //route name for the result page
  static const routeName = '/result'; 

  @override
  Widget build (BuildContext context) { 
    //predefine this data, before getting it rendered in Scaffold
    final double bmiValue=BMICalculator.calculateBMI(BMIData.height, BMIData.weight);
    final String bmiStatus= BMICalculator.getBMI(BMIData.isMale, bmiValue);
    final String bmiMessage= bmiStatus=='Underweight'? 'You are underweight':
     bmiStatus=='Normal'? 'You are in the ideal range' :
     bmiStatus=='Overweight'? 'You are Overweight':
     'You are Obese';
    final imageLocation=BMIData.isDarkMode?'assets/images/bmi_logo_dark.png': 'assets/images/bmi_logo.png';
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI Calculator',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              ),
            ),
          ),
        actions: <Widget>[
          ChangeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            SizedBox(
              height: ScreenSpecs.screenPadTop(context)* 0.5,
            ),
            const Text('Your Result',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
            ),
            //The widget to display the result as a card
            Image.asset(imageLocation),
            ResultBox(classification: bmiStatus, bmiValue: bmiValue, message: bmiMessage),
            //Imported from rounded_button on template, the navigation button from ResultPage() back to CalculatePage()
            RoundedButton(
              text: 'Recalculate', 
              context: context,
              nextPage: CalculatePage.routeName,
              isNavigate: false, //means the Navigation.PushNamed() is used instead of the Navigation.Pop()
            )
          ],
        )
      ),
    );
}}