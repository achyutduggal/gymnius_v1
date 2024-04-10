import 'package:flutter/material.dart';

class WaterIntakeScreen extends StatefulWidget {
  const WaterIntakeScreen({super.key});

  @override
  State<WaterIntakeScreen> createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  int _waterIntake = 0;

  void _incrementWaterIntake() {
    setState(() {
      _waterIntake += 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have consumed $_waterIntake ml of water today.',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementWaterIntake,
              child: const Text('Add 250ml'),
            ),
          ],
        ),
      ),
    );
  }
}
