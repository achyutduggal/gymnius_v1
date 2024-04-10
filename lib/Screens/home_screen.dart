import 'package:flutter/material.dart';
import 'package:gymnius_3/Screens/imagepicker_screen.dart';
import 'splash-screren.dart';
import '../Components/Card.dart';
import '../Components/Topbar.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffe9e9e9),
        appBar: CustomAppBar(
          height: (MediaQuery.of(context).size.height / 2)  ,
          backgroundColor: const Color(0xff131916),
          borderRadius: 25.0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'My Daily Target',
                      style: TextStyle(color: Colors.black, fontSize: 28.0),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
                SingleChildScrollView(
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      _buildGridTile(
                        icon: Icons.water_drop,
                        title: 'Water',
                        subtitle: '2300 ml',
                        color: Colors.black,
                      ),
                      _buildGridTile(
                        icon: Icons.local_fire_department,
                        title: 'Calories',
                        subtitle: '890 kCal',
                        color: Colors.orange,
                      ),
                      _buildGridTile(
                        icon: Icons.monitor_weight,
                        title: 'Weight',
                        subtitle: '82 kg',
                        color: Colors.grey,
                      ),
                      _buildGridTile(
                        icon: Icons.favorite,
                        title: 'BPM',
                        subtitle: '130 BPM',
                        color: Colors.pink,
                      ),
                      _buildGridTile(
                        icon: Icons.monitor_weight,
                        title: 'Weight',
                        subtitle: '',
                        color: Colors.green,
                      ),
                      _buildGridTile(
                        icon: Icons.favorite,
                        title: 'BPM',
                        subtitle: '',
                        color: Colors.red,
                      ),
                      // Add more items here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildGridTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required Color color,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20), // Rounded corners

    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50, color: Colors.white), // Icon
        Text(
          title,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ), // Title
        Text(
          subtitle,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ), // Subtitle
      ],
    ),
  );
}
