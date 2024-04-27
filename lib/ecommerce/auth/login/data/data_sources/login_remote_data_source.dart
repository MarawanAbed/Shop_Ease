
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:flutter/material.dart';

abstract class LoginRemoteDataSource
{
  Future<void> googleSignIn();
  Future<void> twitterSignIn();
  Future<void> gitHubSignIn(BuildContext context);
  Future<void> signInWithEmailAndPassword(String email, String password);

}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource
{
  final AuthService _authService;

  LoginRemoteDataSourceImpl({required AuthService authService}) : _authService = authService;
  @override
  Future<void> gitHubSignIn(BuildContext context)async {
    await _authService.handleGitHubSignIn(context);
  }

  @override
  Future<void> googleSignIn()async {
    await _authService.handleGoogleSignIn();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password)async {
    await _authService.signIn(email: email,password:  password);
  }

  @override
  Future<void> twitterSignIn()async {
    await _authService.signInWithTwitter();
  }

}