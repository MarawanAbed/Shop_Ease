import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/favorite_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang= S.of(context);
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.white,
            title:  Text(
              lang.favorite,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: const FavoriteBody(),
        ),
      ),
    );
  }
}
