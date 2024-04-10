import 'package:flutter/material.dart';
import 'package:gymnius_3/Components/Videoplayerwidget.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: VideoPlayerWidget(videoUrl: Uri.parse('https://www.youtube.com/watch?v=gLQsM6geGzs'),),
    );
  }

}
