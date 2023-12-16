import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class cardWidget extends StatelessWidget {
  final categoyname;
  const cardWidget({super.key, this.categoyname});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {


      },
      child: Container(
        margin: EdgeInsets.only(
          top: 28.0,
        ),
        height: 138.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white, // Replace with your desired color
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Adjust the shadow color and opacity
              spreadRadius: 2.0, // Adjust the spread radius
              blurRadius: 5.0, // Adjust the blur radius
              offset: Offset(0, 2), // Adjust the shadow offset
            ),
          ],
        ),
        // Add your card content here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Group 379.svg', // Replace with the path to your SVG file
              width: 71.6, // Width in logical pixels
              height: 71.6, // Adjust the height as needed
            ),
            Text(
              categoyname,
              style: ThemeText.Text1.copyWith(
                fontSize: 17.3,
                fontWeight: FontWeight.w600,
                color: Color(0xE67F1E).withOpacity(1),
                height: 21.0 /
                    14.0, // Line height in Flutter is represented as the ratio of height to font size
                letterSpacing: 0.0, // Letter spacing in Flutter
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
