import 'package:flutter/material.dart';

import 'screen_specs.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final BuildContext context; //to get the context
  final String nextPage; //to insert the route
  //bikin datanya represent pakai keys
  RoundedButton({
    required this.text,
    required this.context,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context){
    final marginUwU= EdgeInsets.symmetric(vertical: 10); //basically defining the margin object
    return Container(
      margin: marginUwU,
      width: ScreenSpecs.screenWidth(context) * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: newElevatedButton(),
      ),
    );
  }
  Widget newElevatedButton()=> ElevatedButton(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    ),
    onPressed: ()=> Navigator.of(context).pushNamed(nextPage), 
    style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),),
    );
}