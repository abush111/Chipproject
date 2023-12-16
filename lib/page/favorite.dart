import 'dart:collection';

import 'package:chipapp/api_reposirty/favorite_repository.dart';
import 'package:chipapp/helper/Favoritecard.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List productitem = [];
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    fetchData();
    final productStorage = ProductStorage();

    // Get all products
    productitem = await productStorage.getProducts();
    print(productitem); // Print the fetched products
  }

  Future<void> fetchData() async {
    final productStorage = ProductStorage();

    // Get all products
    productitem = await productStorage.getProducts();
    print(productStorage.getProducts());

    // You can print the names for debugging purposes
    for (var product in productitem) {
      setState(() {
        // productitem.add(product);
      });

      print('Name: ${product.name}, Price: ${product.price}');
    }

    setState(() {}); // Trigger a rebuild after fetching data
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width - 28,
                height: 30.0,
                margin: EdgeInsets.only(top: 45.0, left: 28.0),
                child: Text(
                  "Favorite's",
                  style: ThemeText.Text1,
                ),
              ),
            ],
          ),
          // favoritecard(name: 'mm')
          productitem.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: height * 0.4),
                  child: Center(child: CircularProgressIndicator()))
              : SizedBox(
                  height: height,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productitem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return favoritecard(
                        name: productitem[index].name,
                        price: productitem[index].price,
                      );
                    },
                  ),
                )
        ]),
      ),
    );
  }
}
