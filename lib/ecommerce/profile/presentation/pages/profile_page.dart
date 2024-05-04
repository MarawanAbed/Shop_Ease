import 'package:flutter/material.dart';

import '../widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, });


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:  const ProfileBody(
          ),
        ),
      ),
    );
  }
}
