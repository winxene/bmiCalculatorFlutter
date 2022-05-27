import 'package:flutter/material.dart';

import 'screen_specs.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final BuildContext context; //to get the context
  final String nextPage; //to insert the route
  final bool isNavigate; //to check if the button is for navigation, 0 value means that it returns to the home page.

  RoundedButton({
    required this.text,
    required this.context,
    required this.nextPage,
    required this.isNavigate,
  });//constructor

  @override
  Widget build(BuildContext context){
    const marginUwU= EdgeInsets.symmetric(vertical: 10); //basically defining the margin object
    return Container(
      margin: marginUwU,
      width: ScreenSpecs.screenWidth(context) * 0.8, //to make the button fit the screen
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), //to make the button round
        child: newElevatedButton(), //to create the button
      ),
    );
  }
  //to specify the button
  Widget newElevatedButton()=> ElevatedButton(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    ),
    style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),),
    onPressed: ()=> isNavigate?Navigator.of(context).pushNamed(nextPage)//to navigate to the next page
      :Navigator.pop(context), //to return to the home page, very important to prevent multiple state being created
  );  
}