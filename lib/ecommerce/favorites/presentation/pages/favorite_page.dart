import 'package:flutter/material.dart';

import '../widgets/favorite_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.white,
            title: GestureDetector(
              onTap: () => checkRoutes(context),
              child: const Text(
                'Favorite',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: const FavoriteBody(),
        ),
      ),
    );
  }

  void checkRoutes(BuildContext context) {
    var canPop = Navigator.of(context).canPop();
    print('Can pop: $canPop');
  }
}
