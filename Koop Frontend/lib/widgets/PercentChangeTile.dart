import 'package:flutter/material.dart';

class PercentChangeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF6DD697),
      ),
      width: screenWidth * 49 / 375,
      height: screenHeight * 21.72 / 812,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '+10.3%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
