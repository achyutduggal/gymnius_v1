import 'package:flutter/material.dart';
import '../Components/roundedbutton.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fgradienta-26WixHTutxc-unsplash.jpg?alt=media&token=4b3d4985-d8fb-40e9-928f-cf7b4502a858";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                // Place as the child widget of a scaffold
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Welcome to Gymnius',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      GradientButton(
                          text: "Sign in",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),),);
                          }),
                      const SizedBox(
                        height: 24.0,
                      ),
                      GradientButton(
                          text: "Log In",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),),);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
