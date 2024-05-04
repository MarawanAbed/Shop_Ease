import 'package:ecommerce/ecommerce/profile/my_account/data/data_sources/my_account_data_source.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/repositories/my_account_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAccountRepoImpl extends MyAccountRepo
{
  final MyAccountRemoteDataSource _accountRemoteDataSource;

  MyAccountRepoImpl(this._accountRemoteDataSource);
  @override
  Stream<MyAccountModel> getSingleUser() {
    try
    {
      return _accountRemoteDataSource.getSingleUser();
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateEmailAndPassword({required String email, required String password, required BuildContext context}) async{
    try
    {
      return await _accountRemoteDataSource.updateEmailAndPassword(email: email, password: password, context: context);
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async{
    try
    {
      return await _accountRemoteDataSource.updateUser(data);
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

}