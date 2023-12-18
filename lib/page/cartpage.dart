import 'package:chipapp/bloc/cartbloc/cartbloc.dart';
import 'package:chipapp/bloc/cartbloc/cartevent.dart';
import 'package:chipapp/bloc/cartbloc/cartstate.dart';
import 'package:chipapp/bloc/productbloc/product_bloc.dart';
import 'package:chipapp/helper/Thankuwidget.dart';
import 'package:chipapp/helper/cartCard.dart';
import 'package:chipapp/service_locator.dart';
import 'package:chipapp/themes/theme_button.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/productbloc/productevent.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(FetchCartEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitialState) {
            // Display your data here
            return Container(
              child: Text(""),
            );
          } else if (state is CartErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else if (state is CartLoadedState) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width - 28,
                            height: 30.0,
                            margin: EdgeInsets.only(top: 45.0, left: 28.0),
                            child: Text(
                              "Item details",
                              style: ThemeText.Text1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: height,
                        margin: EdgeInsets.only(
                          top: 15.0,
                          // left: 28.0,
                        ),
                        child: SizedBox(
                          height: height,
                          child: ListView.separated(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return cartCard(
                                name: state.cartItems[index].name,
                                price: state.cartItems[index].price,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: state.cartItems.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 28, right: 28, top: height * 0.8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "total " + "\$6",
                                  style: ThemeText.Text1.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    height:
                                        1.5, // Line height equivalent in Flutter
                                    letterSpacing:
                                        0.0, // Letter spacing equivalent in Flutter
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            SizedBox(
                              height: 40,
                              width: width - 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Thankuwidget()),
                                  );
                                },
                                child: Text(
                                  'PLACE ORDER',
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
                ],
              ),
            );
          } else {
            // Loading state
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
