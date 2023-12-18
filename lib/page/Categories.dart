import 'package:chipapp/bloc/Categorybloc/category_bloc.dart';
import 'package:chipapp/bloc/Categorybloc/category_event.dart';
import 'package:chipapp/bloc/Categorybloc/category_state.dart';
import 'package:chipapp/helper/cardWidget.dart';
import 'package:chipapp/page/Bottomnav.dart';
import 'package:chipapp/service_locator.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void init() {
    sl<CategoryBloc>().add(FetchcategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomNav()),
              );
            },
            child: Icon(Icons.arrow_back)),
        title: Center(
          child: Text(
            "Categories",
            style: ThemeText.Text1.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,

              height: 21.0 /
                  14.0, // Line height in Flutter is represented as the ratio of height to font size
              letterSpacing: 0.0, // Letter spacing in Flutter
            ),
          ),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitialState) {
            // Display your data here
            return Container(
              child: Text(""),
            );
          } else if (state is CategoryErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else if (state is CategoryLoadedState) {
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
                itemCount:
                    state.categoryModel.length, // Number of cards in the grid
                itemBuilder: (context, index) {
                  return cardWidget(
                    categoyname: state.categoryModel[index].name,
                    imageurl: state.categoryModel[index].primaryImage,
                    // price: state.productModel[index].singleDeal.originalPrice,
                    // nameitem: state.productModel[index].name,
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
