import 'dart:async';

import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final AuthService authService = getIt<AuthService>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      // Reload the user
      await authService.auth.currentUser?.reload();
      // Check if email is verified
      if (authService.auth.currentUser?.emailVerified == true) {
        // If email is verified, cancel the timer and navigate back
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'A verification link has been sent to your email. Please click the link to verify your email address.',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous screen after the user has clicked the verification link
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Resend the verification email when this button is pressed
                await authService.resendEmailVerification();
              },
              child: const Text('Resend Verification Email'),
            ),
          ],
        ),
      ),
    );
  }
}
