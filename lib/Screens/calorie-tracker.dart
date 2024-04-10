import 'package:flutter/material.dart';
import 'package:gymnius_3/Screens/calorie_maintain_screen.dart';
import 'package:gymnius_3/Screens/imagepicker_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Providers/providers.dart';

class CalorieTracker extends StatefulWidget {
  static const id = 'calorie_tracker';
  const CalorieTracker({Key? key}) : super(key: key);

  @override
  State<CalorieTracker> createState() => _CalorieTrackerState();
}

class _CalorieTrackerState extends State<CalorieTracker> {
  double calories = 0.0;

  Future<void> fetchData(String Item) async {
    const String apiUrl =
        'https://trackapi.nutritionix.com/v2/natural/nutrients';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'x-app-id': 'a8259e1a',
      'x-app-key': 'f6e38658caea15ceb481b5e9e92a700e',
      'x-remote-user-id': '0',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> payload = {
      'query': Item,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      final double caloriesValue = data['foods'][0]['nf_calories'];
      setState(() {
        calories += caloriesValue;
      });
    } else {
      print('API request failed with status code: ${response.statusCode}');
    }
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    String Item = Provider.of<StringData>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutritional Values'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImagePickerScreen(),
                  ),
                );
              },
              child: const Text('Take a Photo'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                fetchData(Item);
                print(Item);
                Provider.of<StringData>(context, listen: false)
                    .updateCalories(calories);
              },
              child: const Text('Fetch Nutritional Values'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Go Back'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CalorieTrackerScreen(),
                  ),
                );
              },
              child: const Text('Add to List '),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Calories: ${calories.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
