import 'package:flutter/material.dart';
import 'package:gymnius_3/Screens/calorie-tracker.dart';
import 'package:gymnius_3/Screens/calorie_maintain_screen.dart';
import 'package:gymnius_3/Screens/home_screen.dart';
import 'package:gymnius_3/Screens/imagepicker_screen.dart';
import 'package:gymnius_3/Screens/diet_screen.dart';
import 'package:gymnius_3/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/providers.dart';
import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => StringData(),child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => WelcomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ImagePickerScreen.id : (context) => ImagePickerScreen(),
        CalorieTracker.id : (context) => CalorieTracker(),
        HomeScreen.id: (context) => HomeScreen(),
        CalorieTrackerScreen.id: (context) => CalorieTrackerScreen(),
        DietScreen.id: (context) => DietScreen(),

      },
    );
  }
}
