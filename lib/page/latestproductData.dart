import 'dart:typed_data';

import 'package:chipapp/api_reposirty/favorite_repository.dart';
import 'package:chipapp/bloc/cartbloc/cartbloc.dart';
import 'package:chipapp/bloc/cartbloc/cartevent.dart';
import 'package:chipapp/bloc/productbloc/product_bloc.dart';
import 'package:chipapp/bloc/productbloc/productevent.dart';
import 'package:chipapp/helper/leastestproductCard.dart';
import 'package:chipapp/hive/cart.dart';
import 'package:chipapp/hive/product.dart';
import 'package:chipapp/page/detialPage.dart';
import 'package:chipapp/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/productbloc/productstate.dart';

class latestproductData extends StatefulWidget {
  const latestproductData({super.key});

  @override
  State<latestproductData> createState() => _latestproductDataState();
}

class _latestproductDataState extends State<latestproductData> {
  void init() {
    sl<ProductBloc>().add(FetchProductEvent());

    final productStorage = ProductStorage();
    super.initState();
  }

  bool clilck = true;
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = CartBloc();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitialState) {
            // Display your data here
            return Container(
              child: Text(""),
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else if (state is ProductLoadedState) {
            // return ListView.builder(
            //   itemCount: state.productModel.data.length,
            //   itemBuilder: (context, index) {
            //     return (Text(index.toString()));
            //   },
            // );
            return Container(
              height: height,
              margin: EdgeInsets.only(top: 15.0, left: 28.0, right: 28.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 20.0, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: state.productModel.length -
                    4, // Number of cards in the grid
                itemBuilder: (context, index) {
                  return InkWell(
                    onDoubleTap: () {
                      setState(() {
                        clilck = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailPage(
                                  discription:
                                      state.productModel[index].longDescription,
                                  name: state.productModel[index].name,
                                  price: state.productModel[index].singleDeal
                                      .originalPrice,
                                )),
                      );
                    },
                    child: leastestProductCard(
                        onDataUpdate: () async {
                          final productStorage = ProductStorage();
                          await productStorage.saveProduct(Product(
                            name: state.productModel[index].name,
                            price: double.parse(state
                                .productModel[index].singleDeal.originalPrice),
                            imageBytes: Uint8List.fromList(
                                []), // Replace with actual image bytes
                          ));
                        },
                        imageurl: state.productModel[index].primaryImage,
                        price:
                            state.productModel[index].singleDeal.originalPrice,
                        nameitem: state.productModel[index].name,
                        addtocart: () {
                          String image = state.productModel[index].primaryImage;
                          String name = state.productModel[index].name;
                          String price = state
                              .productModel[index].singleDeal.originalPrice;
                          int count = state.productModel[index].groupCount;

                          final Cart productToAdd = Cart(
                              name: name,
                              price: double.parse(price),
                              imageBytes: Uint8List.fromList([]),
                              count: count);
                          print("kkkkk");

                          cartBloc.add(AddToCartEvent(productToAdd));

                          // Dispatch the AddToCartEvent
                        },
                        detail: false),
                  );
                },
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
