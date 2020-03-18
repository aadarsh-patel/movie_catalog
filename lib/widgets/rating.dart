import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  Rating(this.rating);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: EdgeInsets.all(3),
        color: Colors.yellow,
        child: Text(
          'IMDb\n$rating',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
