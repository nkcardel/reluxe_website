import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          Icon(
            i <= rating.floor()
                ? Icons.star // Fully shaded star
                : i - rating <= 0.5
                    ? Icons.star_half // Half shaded star
                    : Icons.star_border, // Empty star
            color: Colors.yellow.shade800, // You can use any color you like
          ),
      ],
    );
  }
}
