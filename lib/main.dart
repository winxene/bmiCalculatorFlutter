import 'package:flutter/material.dart';
import 'package:midexam/models/bmi_data.dart';

//routes
import 'package:provider/provider.dart';




//Screens/views needs to be imported to register the page
import '../view/result_page.dart';
import '../view/calculate_page.dart';

//models 
import 'providers/theme_provider.dart'; //provider for theme

//to run the app
Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); //needed for the theme provider
  runApp(BmiApp());
}

//creating STatefulWIdget
class BmiApp extends StatefulWidget {
  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State <BmiApp> {
  //darkMode Light mode changer
  bool isDarkModeEnabled = false;
 //haloo 
  //set the app theme same to the phone theme

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
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
      //routes to the different screens, will be used by the Navigation.PushNamed()
      routes: {
        '/': (ctx) => CalculatePage(), // the '/' show the initial screen
        ResultPage.routeName: (ctx) => ResultPage(), //navigate to calculate page
      },
      onUnknownRoute: (settings) { // this is the way to handle the unknown route and to prevent the app from crashing
        return MaterialPageRoute(builder: (ctx) => CalculatePage());
      },
    );
    }
  );
}
