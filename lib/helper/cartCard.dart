import 'package:chipapp/themes/custom_colors.dart';
import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';

class cartCard extends StatelessWidget {
  final name;
  final price;
  const cartCard({super.key, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 113,
      margin: EdgeInsets.only(top: 41.0, left: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              "assets/images/placeholderb.png",
              height: 113,
              width: 93,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          SizedBox(
              height: 113,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: ThemeText.Text1.copyWith(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "$name",
                    style: ThemeText.Text1.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 47,
                  ),
                  Text(
                    "\$$price",
                    style: ThemeText.Text1.copyWith(
                        fontSize: 18,
                        color:
                            CustomColors.onbroadingbackground.withOpacity(1)),
                  ),
                ],
              )),
          SizedBox(
            width: 60,
          ),
          SizedBox(
              height: 115,
              child: Column(
                children: [
                  // Icon(Icons.heart_broken_outlined),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 33,
                    width: 135,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xEFEFEF).withOpacity(1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Icon(Icons.add),
                          ),
                          Text(
                            '',
                            style: ThemeText.Text1.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Icon(Icons.remove),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
    ;
  }
}
