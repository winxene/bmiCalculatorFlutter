import 'package:flutter/material.dart';
import 'package:midexam/models/bmi_data.dart';
import 'package:midexam/view/splash_page.dart';
//routes

import 'package:provider/provider.dart';

//Screens/views
import '../view/result_page.dart';
import '../view/calculate_page.dart';

//models
import 'providers/theme_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(BmiApp());
}

class BmiApp extends StatefulWidget {
  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State <BmiApp> {
  //darkMode Light mode changer
  bool isDarkModeEnabled = false;
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
      isDarkModeEnabled=BMIData.isDarkModeEnabled;
    });
  }
  @override
   Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // final mediaQuery = MediaQuery.of(context);
    // final isLandscape = mediaQuery.orientation == Orientation.landscape;
    
    return MaterialApp(
      title: 'BMI Calculator',
       themeMode: themeProvider.themeMode,
      theme: AvailableTheme.lightTheme,
      darkTheme: AvailableTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => SplashPage(), // the '/' show the initial screen
        CalculatePage.routeName: (ctx) => CalculatePage(),
        ResultPage.routeName: (ctx) => ResultPage(), //navigate to calculate page
      },
      onUnknownRoute: (settings) { // this is the way to handle the unknown route
        return MaterialPageRoute(builder: (ctx) => CalculatePage());
      },
    );
    }
  );
}
