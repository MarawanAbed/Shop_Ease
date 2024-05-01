import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarAndCounter extends StatelessWidget {
  const StarAndCounter({
    super.key,
    required this.counter,
    required this.onCounterChanged,
  });

  final int counter;
  final ValueChanged<int> onCounterChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.deepPurple),
            onRatingUpdate: (rating) {
            },
          ),
        ),
        Expanded(
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    onCounterChanged(counter + 1);
                  },
                  child: const Icon(Icons.add)),
              Text('$counter'),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        if (counter > 1) {
                          onCounterChanged(counter - 1);
                        }
                      },
                      child: const Icon(Icons.remove))),
            ],
          ),
        ),
      ],
    );
  }
}
