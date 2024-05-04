import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';
import 'package:flutter/material.dart';

abstract class MyAccountRemoteDataSource {
  Stream<MyAccountModel> getSingleUser();

  Future<void> updateUser(Map<String, dynamic> data);

  Future<void> updateEmailAndPassword(
      {required String email, required String password,required BuildContext context});
}


class MyAccountRemoteDataSourceImpl extends MyAccountRemoteDataSource {
  final DatabaseService _databaseService;
  final AuthService _authService;

  MyAccountRemoteDataSourceImpl(this._databaseService, this._authService);
  @override
  Stream<MyAccountModel> getSingleUser() {
    return _databaseService.getSingleUser();
  }

  @override
  Future<void> updateEmailAndPassword({required String email, required String password, required BuildContext context})async {
    await _authService.updateEmailAndPassword(email: email, password: password, context: context);
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async{
    await _databaseService.updateUser(data);
  }
}