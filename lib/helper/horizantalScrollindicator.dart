import 'package:flutter/material.dart';

class HorizontalScrollIndicator extends StatelessWidget {
  final int itemCount;
  final double currentPage;

  HorizontalScrollIndicator({
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.0,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          double opacity = (index - currentPage).abs().clamp(0.0, 1.0);

          return Container(
            width: 20.0,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(5.0),
            ),
          );
        },
      ),
    );
  }
}
