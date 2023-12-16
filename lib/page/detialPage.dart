import 'package:chipapp/helper/horizantalScrollindicator.dart';
import 'package:chipapp/themes/custom_colors.dart';
import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';

import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  String discription;
  String price;
  String name;
  detailPage(
      {super.key,
      required this.discription,
      required this.name,
      required this.price});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/Rectangle 244.png",
                height: 280,
                width: width,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 53.0, left: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: SizedBox(
                          width: 24.0,
                          height: 22.0,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 5,
                margin: EdgeInsets.only(
                    top: 210.0, left: width * 0.38, right: width * 0.38),
                child: HorizontalScrollIndicator(
                  itemCount: 4,
                  currentPage: _currentPage,
                ),
              )
            ],
          ),
          Positioned(
            child: Container(
              width: width,
              height: 498,

              margin: EdgeInsets.only(top: 230.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white, // Replace with your desired color
              ),
              // Your other widgets go here

              child: Column(children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: ThemeText.Text1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        height: 37,
                        width: 135,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Add to cart',
                            style: ThemeText.Text1.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ThemeButton.primaryButtonStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 21, right: 21, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$" + price,
                          style: ThemeText.Text1.copyWith(
                            fontSize: 24,
                            color: CustomColors.onbroadingbackground
                                .withOpacity(1),
                            fontWeight: FontWeight.w500,
                          )),
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 21,
                    right: 21,
                  ),
                  child: LinearProgressIndicator(
                    value: 0.4, // Set the progress value (0.0 to 1.0)
                    backgroundColor:
                        Colors.grey[300], // Set the background color
                    valueColor: AlwaysStoppedAnimation<Color>(CustomColors
                        .onbroadingbackground
                        .withOpacity(1)), // Set the progress color
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 21,
                    right: 21,
                  ),
                  child: Row(
                    children: [
                      Text("Description",
                          style: ThemeText.Text1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 21,
                    right: 21,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(discription,
                            style: ThemeText.Text1.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
