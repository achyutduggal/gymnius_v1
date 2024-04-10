import 'package:flutter/material.dart';
import 'package:gymnius_3/Components/datepicker.dart';
import 'package:gymnius_3/Screens/diet_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double height;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double borderRadius;

  const CustomAppBar({
    Key? key,
    this.title,
    this.height = 56.0,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.borderRadius = 16.0,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(borderRadius),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white30,
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
                              Icons.search,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Gymnius',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white30,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              50), // Ensures the splash effect is circular
                          splashColor: Colors.grey,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DietScreen(),),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(
                                8), // Optional padding for the icon
                            child: Icon(
                              Icons.emoji_food_beverage_rounded,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const DatePicker(),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'You\'ve gained 2KG in a month, Keep going !!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  '940 kcal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 40.0,
                      percent: 0.37,
                      progressColor: Colors.green,
                      rotateLinearGradient: true,
                      center: Text(
                        '37%',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      footer: Text(
                        'Protien',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 40.0,
                      percent: 0.53,
                      progressColor: Colors.yellow,
                      rotateLinearGradient: true,
                      center: Text(
                        '53%',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      footer: Text(
                        'Carbs',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 40.0,
                      percent: 0.65,
                      progressColor: Colors.red,
                      rotateLinearGradient: true,
                      center: Text(
                        '65%',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      footer: Text(
                        'Fat',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
