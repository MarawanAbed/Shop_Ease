import 'package:flutter/material.dart';

abstract class LoginRepo
{
  Future<void> googleSignIn();
  Future<void> twitterSignIn();
  Future<void> gitHubSignIn(BuildContext context);
  Future<void> signInWithEmailAndPassword(String email, String password);
}