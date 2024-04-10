import 'package:flutter/material.dart';


class CalorieTrackerScreen extends StatefulWidget {

  static const id = 'maintain_screen';

  @override
  _CalorieTrackerScreenState createState() => _CalorieTrackerScreenState();
}

class _CalorieTrackerScreenState extends State<CalorieTrackerScreen> {

  TextEditingController foodNameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();


  List<FoodItem> _foodItems = [];

  void _addFoodItem(String name, double calories) {
    setState(() {
      _foodItems.add(FoodItem(name: name, calories: calories));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracker'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                final serialNumber = index + 1; // Adding 1 to make it 1-based index
                final foodItem = _foodItems[index];

                return ListTile(
                  title: Text('$serialNumber. ${foodItem.name}'),
                  subtitle: Text('${foodItem.calories} calories'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: foodNameController,
                    decoration: InputDecoration(labelText: 'Food Item'),
                    onChanged: (value) {
                      // You can add validation here if needed
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: caloriesController,
                    decoration: InputDecoration(labelText: 'Calories'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // You can add validation here if needed
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Get the values from the text fields
                    final foodName = foodNameController.text;
                    final calories = double.tryParse(caloriesController.text) ?? 0; // Default to 0 if parsing fails

                    if (foodName.isNotEmpty && calories > 0) {
                      _addFoodItem(foodName, calories);

                      // Clear the text fields
                      foodNameController.clear();
                      caloriesController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final double calories;

  FoodItem({required this.name, required this.calories});
}
