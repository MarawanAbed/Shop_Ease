import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang=S.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            lang.marwan_ehab_mohamed_abed,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            lang.software_engineer,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
          const Divider(color: Colors.deepPurple, thickness: 2),
          const SizedBox(height: 16.0),
           Text(
            lang.about_me,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            lang.marwan_bio,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
          const Divider(color: Colors.deepPurple, thickness: 2),
          const SizedBox(height: 16.0),
           Text(
            lang.skills,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            lang.flutter_dart_front_end,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}