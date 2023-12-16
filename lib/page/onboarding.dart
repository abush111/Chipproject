import 'package:chipapp/page/Loginpage.dart';
import 'package:chipapp/themes/custom_colors.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  Future<void> _initializeApp() async {
    // Perform any necessary initialization tasks here
    await Future.delayed(
        const Duration(seconds: 4)); // Simulate a delay of 2 seconds
  }

// Inside your widget's build method

  @override
  Widget build(BuildContext context) {
    _initializeApp().then((_) async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.onbroadingbackground.withOpacity(1),
      body: Column(
        children: [
          Expanded(
              child: Container(
            // Height in logical pixels
            margin: EdgeInsets.only(top: 365, left: 122, right: 121.98),
            child: SvgPicture.asset(
              'assets/images/Group 441.svg', // Replace with the path to your SVG file
              width: 131.02, // Width in logical pixels
              height: 197, // Adjust the height as needed
            ),
          )),
          Container(
            width: 226.0, // Width in logical pixels
            height: 41.0, // Height in logical pixels
            margin: EdgeInsets.only(
              bottom: 127.0,
              top: 38,
              left: 74.0,
              right: 75,
            ),
            child: Text(
              "Fresh Fruits",
              style: ThemeText.bodyTwo,
            ),
          )
        ],
      ),
    );
  }
}
