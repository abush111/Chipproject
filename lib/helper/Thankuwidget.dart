import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class Thankuwidget extends StatelessWidget {
  const Thankuwidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              width: width - 28,
              height: 21.0,
              margin: EdgeInsets.only(top: 61.0, left: 28.0, right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank You",
                    style: ThemeText.Text1.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5, // Line height equivalent in Flutter
                      letterSpacing:
                          0.0, // Letter spacing equivalent in Flutter
                    ),
                  )
                ],
              ),
            ),
            Container(
              // Height in logical pixels
              margin: EdgeInsets.only(top: 171, left: 45, right: 45),
              child: Row(
                children: [
                  // SvgPicture.asset(
                  //   'assets/images/shadowimage.svg', // Replace with the path to your SVG file
                  //   width: 78.9, // Width in logical pixels
                  //   height: 60.4, // Adjust the height as needed
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 120,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/flower.svg', // Replace with the path to your SVG file
                      width: 32.9, // Width in logical pixels
                      height: 44.4, // Adjust the height as needed
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/Groupphone.svg', // Replace with the path to your SVG file
                    width: 92.5, // Width in logical pixels
                    height: 188.9, // Adjust the height as needed
                  ),
                  SvgPicture.asset(
                    'assets/images/Group.svg', // Replace with the path to your SVG file
                    width: 162.02, // Width in logical pixels
                    height: 142, // Adjust the height as needed
                  ),
                ],
              ),
            ),
            Container(
              width: width - 28,
              height: 21.0,
              margin: EdgeInsets.only(top: 406.0, left: 28.0, right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Order in process",
                    style: ThemeText.Text1.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5, // Line height equivalent in Flutter
                      letterSpacing:
                          0.0, // Letter spacing equivalent in Flutter
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width - 56,
              height: 21.0,
              margin: EdgeInsets.only(top: 430.0, left: 28.0, right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod",
                    style: ThemeText.Text1.copyWith(
                      fontSize: 14.0,
                      color: Color(0x000000).withOpacity(1),
                      fontWeight: FontWeight.w400,
                      // Line height equivalent in Flutter
                      letterSpacing:
                          0.0, // Letter spacing equivalent in Flutter
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      EdgeInsets.only(left: 28, right: 28, top: height * 0.8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 11,
                      ),
                      SizedBox(
                        height: 40,
                        width: width - 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'go back home',
                            style: ThemeText.Text1.copyWith(fontSize: 16),
                          ),
                          style: ThemeButton.primaryButtonStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
