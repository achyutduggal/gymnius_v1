import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
        name: 'Drinking Tracker',
        imageUrl:
            'https://th.bing.com/th/id/OIP.ET2S29j1BZU93I5GztWL0gHaE1?rs=1&pid=ImgDetMain',),

    Category(
        name: 'Gym',
        imageUrl:
            'https://smartfitnessgeek.com/wp-content/uploads/2020/05/lose-weight-on-a-treadmill.jpg',),

    Category(
        name: 'Diet Tracker',
        imageUrl:
            'https://th.bing.com/th/id/OIP.Vn1gehpKSHhVIOJSmfpv7QHaE8?rs=1&pid=ImgDetMain',),

    Category(
        name: 'Yoga',
        imageUrl:'https://imgk.timesnownews.com/story/iStock-1076946698.jpg', ),

  ];
}
