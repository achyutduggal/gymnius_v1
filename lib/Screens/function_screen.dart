import 'package:flutter/material.dart';
import 'package:gymnius_3/Screens/calorie-tracker.dart';
import 'package:gymnius_3/Screens/drinking_screen.dart';
import 'package:gymnius_3/Screens/gym_screen.dart';
import 'package:gymnius_3/Screens/yoga_screen.dart';

import '../Components/functionbuttons.dart';

class FunctionScreen extends StatelessWidget {
  const FunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FunctionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrinkingScreen(),),
                    );
                  },
                  text: 'Drinking Tracker',
                  color: const Color(0xff59A96A),
                  icon: Icons.local_drink_rounded,
                ),
                const SizedBox(height: 10.0,),
                FunctionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GymScreen(),),
                    );
                  },
                  text: 'Gym',
                  color: const Color(0xff59A96A),
                  icon: Icons.health_and_safety_rounded,
                ),
                const SizedBox(height: 10.0,),
                FunctionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalorieTracker(),),
                    );
                  },
                  text: 'Diet Tracker',
                  color: const Color(0xff59A96A),
                  icon: Icons.fastfood_rounded,
                ),
                const SizedBox(height: 10.0,),
                FunctionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => YogaScreen()));
                  },
                  text: 'Yoga',
                  color: const Color(0xff59A96A),
                  icon: Icons.sports_gymnastics_rounded,
                ),
                const SizedBox(height: 10.0,),
                FunctionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Go Back',
                  color: const Color(0xff59A96A),
                  icon: Icons.arrow_back,
                ),
                const SizedBox(height: 10.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
