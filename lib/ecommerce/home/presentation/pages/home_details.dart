import 'package:flutter/material.dart';

import '../widgets/home_details_body.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_sharp),
            ),
          ],
        ),
        body: const HomeDetailsBody(),
      ),
    );
  }
}

