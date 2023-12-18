import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HorizontalScrollWidget extends StatelessWidget {
  final imageurl;
  const HorizontalScrollWidget({super.key, this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93.0,
      height: 73.0,
      // margin: EdgeInsets.only(
      //   top: 15.0,
      // ),
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
      child: Center(
        child: Image.network(
          "https://productionchipchip.fra1.digitaloceanspaces.com/$imageurl", // Replace with the path to your SVG file
          width: 40, // Width in logical pixels
          height: 40, // Adjust the height as needed
        ),
      ),
    );
    ;
  }
}
