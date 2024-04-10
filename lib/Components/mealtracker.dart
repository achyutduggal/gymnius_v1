import 'package:flutter/material.dart';

class MealTracker extends StatelessWidget {
  const MealTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Breakfast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '730kcal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '05:00 pm - 07:00 pm',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Stack(
                    children: [
                      Positioned(
                        left: 50,
                        child: _buildFoodItem('https://www.culinaryhill.com/wp-content/uploads/2023/09/Blueberry-Pancakes-Culinary-Hill-1200x800-1.jpg', '250kcal'),
                      ),
                      Positioned(
                        left: 30,
                        child: _buildFoodItem('https://media.post.rvohealth.io/wp-content/uploads/2020/09/bananas-732x549-thumbnail.jpg', '120kcal'),
                      ),
                      _buildFoodItem('https://www.exploratorium.edu/sites/default/files/styles/social_standard/public/GassyEggs_DSC_0314_H.jpg?h=e688e4e6&itok=dOX2LwAn', '10kcal'),
                      Positioned(
                        left: 80,
                        top: 0,
                        bottom: 0,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add, color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFoodItem(String imagePath, String calories) {
  return Column(
    children: [
      Image.asset(imagePath, width: 60), // Use actual image paths
      Text(
        calories,
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
