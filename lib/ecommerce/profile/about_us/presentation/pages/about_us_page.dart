import 'package:flutter/material.dart';

import '../widgets/about_us_body.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text('About Us'),
        ),
        body: const AboutUsBody(),
      ),
    );
  }
}
