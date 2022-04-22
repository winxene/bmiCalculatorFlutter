import 'package:flutter/material.dart';

//note that to run this, use flutter run --no-sound-null-safety
import 'package:splashscreen/splashscreen.dart';

//screen
import 'package:midexam/view/calculate_page.dart';

//bmi_data
import 'package:midexam/models/bmi_data.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  bool isDarkMode= BMIData.isDarkModeEnabled;

  Widget mySplashScreen (bool isDarkMode) => SplashScreen(
      seconds: 3,
      navigateAfterSeconds: CalculatePage(),
      title: const Text(
        'Welcome to BMI Calculator',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
      image: Image.asset(
        'assets/images/bmi_logo.png',
        width: 1000,
        height: 1000,
      ),
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      styleTextUnderTheLoader: const TextStyle(
        fontSize: 20,
      ),
      photoSize: 100,
      loaderColor: isDarkMode?Colors.white:Colors.black,
    );
  @override
  Widget build(BuildContext context)=>Container(
    child: mySplashScreen(isDarkMode),
  );
}
