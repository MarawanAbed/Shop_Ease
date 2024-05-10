import 'package:ecommerce/generated/l10n.dart';
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
            automaticallyImplyLeading: false,
            title:  Text(
              S.of(context).profile,
              style: const TextStyle(
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
