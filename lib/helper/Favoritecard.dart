import 'package:chipapp/themes/custom_colors.dart';
import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class favoritecard extends StatelessWidget {
  final name;
  final price;
  final imageurl;
  const favoritecard({super.key, this.name, this.price, this.imageurl});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: 113,
        margin: EdgeInsets.only(top: 23.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  "https://productionchipchip.fra1.digitaloceanspaces.com/product/ba0a94c1-0f9e-40fd-a27c-ab8782ca19be.jpg", // Replace with the path to your SVG file
                  height: 113,
                  width: 93, // Adjust the height as needed
                ),
              ),
              title: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      name,
                      style: ThemeText.Text1.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      // margin: EdgeInsets.only(
                      //   left: 64,
                      // ),
                      child: SvgPicture.asset(
                        'assets/images/ic_wishlistfovarite.svg', // Replace with the path to your SVG file
                        width: 24, // Width in logical pixels
                        height: 24, // Adjust the height as needed
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Row(children: [
                Text(
                  "\$$price",
                  style: ThemeText.Text1.copyWith(
                    fontSize: 18,
                    color: CustomColors.onbroadingbackground.withOpacity(1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 35,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add to cart',
                      style: ThemeText.Text1.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ThemeButton.roundedButtonStyle,
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
