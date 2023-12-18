import 'package:chipapp/bloc/Categorybloc/category_bloc.dart';
import 'package:chipapp/bloc/Categorybloc/category_state.dart';
import 'package:chipapp/helper/horizontalscrollwidget.dart';
import 'package:chipapp/page/Categories.dart';
import 'package:chipapp/page/latestproductData.dart';
import 'package:chipapp/themes/custom_colors.dart';
import 'package:chipapp/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void init() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width - 28,
                      height: 21.0,
                      margin: EdgeInsets.only(top: 45.0, left: 28.0),
                      child: Text(
                        "Good Morning",
                        style: ThemeText.normaltext,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 30.0,
                  width: width - 56,
                  margin: EdgeInsets.only(top: 5.0, left: 28.0, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rafatul Islam",
                        style: ThemeText.normaltext2,
                      ),
                      Badge(
                        backgroundColor:
                            CustomColors.onbroadingbackground.withOpacity(1),
                        child: SvgPicture.asset(
                          'assets/images/ic_notif.svg', // Replace with the path to your SVG file
                          width: 24, // Width in logical pixels
                          height: 24, // Adjust the height as needed
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30.0,
            width: width - 56,
            margin: EdgeInsets.only(top: 15.0, left: 28.0, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: ThemeText.normaltext2.copyWith(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Categories()),
                      );
                    },
                    child: Icon(Icons.arrow_forward)),
              ],
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
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
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15.0, left: 28.0),
                  height: 73,
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 73,
                          child: HorizontalScrollWidget(
                            imageurl: state.categoryModel[index].primaryImage,
                          ),
                        );
                      },
                      itemCount: state.categoryModel.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            width: 10,
                          )),
                );
              } else {
                // Loading state
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )

          //
          ,
          Container(
            height: 30.0,
            width: width - 56,
            margin: EdgeInsets.only(top: 30.0, left: 28.0, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Products",
                  style: ThemeText.normaltext2.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height, child: latestproductData()),
        ]),
      ),
    );
  }
}
