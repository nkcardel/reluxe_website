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

class ClickableStarRating extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  const ClickableStarRating(
      {super.key, required this.initialRating, required this.onRatingChanged});

  @override
  State<ClickableStarRating> createState() => _ClickableStarRatingState();
}

class _ClickableStarRatingState extends State<ClickableStarRating> {
  double _currentRating = 0.0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () {
              // Update the current rating when a star is tapped
              setState(() {
                _currentRating = i.toDouble();
                widget.onRatingChanged(_currentRating);
              });
            },
            child: Icon(
              i <= _currentRating
                  ? Icons.star
                  : i - _currentRating <= 0.5
                      ? Icons.star_half
                      : Icons.star_border,
              color: Colors.yellow.shade800,
            ),
          ),
      ],
    );
  }
}
