import 'package:chipapp/bloc/cartbloc/cartbloc.dart';
import 'package:chipapp/bloc/cartbloc/cartevent.dart';
import 'package:chipapp/bloc/cartbloc/cartstate.dart';
import 'package:chipapp/constants/constants.dart';
import 'package:chipapp/page/Categories.dart';

import 'package:chipapp/page/Home.dart';
import 'package:chipapp/page/cartpage.dart';
import 'package:chipapp/page/favorite.dart';
import 'package:chipapp/page/profilepage.dart';
import 'package:chipapp/service_locator.dart';
import 'package:chipapp/themes/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:svg_flutter/svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    super.key,
  });
  @override
  BottomNaState createState() => BottomNaState();
}

class BottomNaState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  var profileData2;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    sl<CartBloc>().add(FetchCartEvent());

    _tabController!.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var count = Constants.totalitem;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset(
                    'assets/images/item.svg', // Replace with the path to your SVG file

                    width: 74.4,
                    height: 62.5,

// Adjust the height as needed
                  )
                : SvgPicture.asset(
                    'assets/images/itemnotactive.svg', // Replace with the path to your SVG file

                    width: 74.4,
                    height: 62.5,

// Adjust the height as needed
                  ),
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //   Icons.search,
          //   size: 20,
          // )),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
                    "assets/images/transfer.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    "assets/images/transfernotactive.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/images/ic_cartactive.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  )
                : BlocBuilder<CartBloc, CartState>(
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
                        return Badge.count(
                          count: state.cartItems.length,
                          backgroundColor:
                              CustomColors.onbroadingbackground.withOpacity(1),
                          textColor: Colors.white,
                          child: SvgPicture.asset(
                            "assets/images/ic_cart.svg", // Replace with the path to your SVG file

                            width: 24,
                            height: 24,

                            // Adjust the height as needed
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
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset(
                    "assets/images/ic_wishlistactive.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  )
                : SvgPicture.asset(
                    "assets/images/ic_wishlist.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? SvgPicture.asset(
                    "assets/images/Frame.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  )
                : SvgPicture.asset(
                    "assets/images/Frame.svg", // Replace with the path to your SVG file

                    width: 24,
                    height: 24,

// Adjust the height as needed
                  ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return Stack(children: [
          if (_selectedIndex == 0)
            Home()
          else if (_selectedIndex == 1)
            Categories()
          else if (_selectedIndex == 2)
            CartPage()
          else if (_selectedIndex == 3)
            Favorite()
          else if (_selectedIndex == 4)
            Profilepage()
        ]);
      },
    );
  }
}
