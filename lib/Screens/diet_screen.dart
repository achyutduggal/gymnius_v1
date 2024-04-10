import 'package:flutter/material.dart';
import 'package:gymnius_3/Components/imagecarousel.dart';
import 'package:gymnius_3/Components/mealtracker.dart';

class DietScreen extends StatefulWidget {
  static const id = 'diet_screen';

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color((0xffe9e9e9)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.white30,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                            50), // Ensures the splash effect is circular
                        splashColor: Colors.grey,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(
                              8), // Optional padding for the icon
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 28,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                            50), // Ensures the splash effect is circular
                        splashColor: Colors.grey,
                        onTap: () {
                          print('Circle Avatar tapped!');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(
                              8), // Optional padding for the icon
                          child: Icon(
                            Icons.view_agenda_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:28.0,),
              const Text('Ready to live',style: TextStyle(fontSize: 48.0),),
              const Text('Healthier?',style: TextStyle(fontSize: 48.0),),
              const SizedBox(height:16.0,),
              Expanded(child: ImageCarousel(),),
              const SizedBox(height: 24.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Today\'s Meal', style: TextStyle(fontSize: 26.0),),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_rounded,color: Color(0xff39FF14),size: 40.0,),),
                ],
              ),
              const SizedBox(height: 180.0,),
            ],
          ),
        ),
      ),
    );
  }
}
