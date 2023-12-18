import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class leastestProductCard extends StatelessWidget {
  final imageurl;
  final price;
  final nameitem;

  final bool detail;

  final Function() onDataUpdate;
  final Function() addtocart;
  const leastestProductCard({
    super.key,
    this.imageurl,
    this.price,
    this.nameitem,
    required this.onDataUpdate,
    required this.addtocart,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white, // Replace with your desired color
        boxShadow: [
          BoxShadow(
            color: Colors.black12
                .withOpacity(0.1), // Adjust the shadow color and opacity
            spreadRadius: 1.0, // Adjust the spread radius
            blurRadius: 1.0, // Adjust the blur radius
            offset: Offset(0, 0.2), // Adjust the shadow offset
          ),
        ],
      ),
      // Add your card content here
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://productionchipchip.fra1.digitaloceanspaces.com/$imageurl",
                      width: 150,
                      height: 90,
                    ),
                  ],
                ),
                Positioned(
                  left: 12,
                  top: 6,
                  child: InkWell(
                      onTap: () {
                        onDataUpdate();
                      },
                      child: detail == true
                          ? SvgPicture.asset(
                              'assets/images/ic_wishlistfovarite.svg', // Replace with the path to your SVG file
                              width: 24, // Width in logical pixels
                              height: 24, // Adjust the height as needed
                            )
                          : SvgPicture.asset(
                              'assets/images/ic_wishlistnotfovirite.svg', // Replace with the path to your SVG file
                              width: 24, // Width in logical pixels
                              height: 24, // Adjust the height as needed
                            )),
                ),
              ],
            ),
            SizedBox(
              height: 54,
              child: ListTile(
                title: Text(
                  nameitem,
                  style: ThemeText.Text1.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    height: 21.0 /
                        14.0, // Line height in Flutter is represented as the ratio of height to font size
                    letterSpacing: 0.0, // Letter spacing in Flutter
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$" + price,
                      textAlign: TextAlign.left,
                      style: ThemeText.Text1.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 21.0 /
                            14.0, // Line height in Flutter is represented as the ratio of height to font size
                        letterSpacing: 0.0, // Letter spacing in Flutter
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        addtocart();
                        print('dddddd');
                      },
                      child: Text(
                        "Add to cart",
                        style: ThemeText.Text1.copyWith(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0000).withOpacity(1),
                          height: 21.0 /
                              14.0, // Line height in Flutter is represented as the ratio of height to font size
                          letterSpacing: 0.0, // Letter spacing in Flutter
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
