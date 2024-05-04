import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';
import 'package:flutter/material.dart';

abstract class MyAccountRepo {
  Stream<MyAccountModel> getSingleUser();

  Future<void> updateUser(Map<String, dynamic> data);

  Future<void> updateEmailAndPassword(
      {required String email, required String password,required BuildContext context});
}