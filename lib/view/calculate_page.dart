import 'package:flutter/material.dart';
//widgets
import '../widgets/for_calculate_page/height_slider_widget.dart'; //height slider widget
import '../widgets/for_calculate_page/male_female_button.dart'; //male female button widget
import '../widgets/for_calculate_page/weight_button_widget.dart'; //weight button
import '../widgets/change_theme_button.dart';

//components -> Basically a template 
import '../components/rounded_button.dart';
import '../components/screen_specs.dart';
//views
import 'result_page.dart';


class CalculatePage extends StatefulWidget {
  //the route of the app
  static const routeName= '/calculate';

  @override
  State createState() => _CalculatePageState();
}

class _CalculatePageState extends State <CalculatePage>{
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          SizedBox(
            // height: mediaQuery.padding.top*0.5,
            height: ScreenSpecs.screenPadTop(context)* 0.05,
            ),
          //Button for choosing Gender
          MaleFemaleButton(),
          //Widget for choosing  Height
          HeightSliderWidget(),
          //Widget for choosing weight
          WeightButtonWidget(),
          //Imported from rounded_button on template, //the navigation button from CalculatePage() to ResultPage()
          RoundedButton(
            text: 'Calculate',
            context: context,
            nextPage: ResultPage.routeName,
            isNavigate: true,  //means the Navigation.PushNamed() is used instead of the Navigation.Pop()
          ),
        ],
      ),
    );
  }
}