import 'package:ecommerce/ecommerce/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/repositories/login_repo.dart';
import 'package:flutter/material.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepoImpl({required LoginRemoteDataSource loginRemoteDataSource})
      : _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<void> gitHubSignIn(BuildContext context)async {
    try {
      await _loginRemoteDataSource.gitHubSignIn(context);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> googleSignIn() async{
    try {
      await _loginRemoteDataSource.googleSignIn();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _loginRemoteDataSource.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> twitterSignIn()async {
    try {
      await _loginRemoteDataSource.twitterSignIn();
    } catch (e) {
      rethrow;
    }
  }
}
