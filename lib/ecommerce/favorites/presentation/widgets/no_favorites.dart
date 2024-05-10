import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).no_favorites_yet,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
