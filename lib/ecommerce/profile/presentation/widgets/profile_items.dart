import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    super.key,
    required this.title,
    required this.light,
    required this.icon,
    this.routes,
  });

  final String title;
  final bool light;
  final IconData icon;
  final String? routes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (routes == null) {
          getIt<AuthService>()
              .signOut()
              .then((_) => Navigators.pushNamedAndRemoveUntil(Routes.login));
        } else {
          Navigators.pushNamed(routes!);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: light ? Colors.grey : Colors.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: light ? Colors.grey : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
