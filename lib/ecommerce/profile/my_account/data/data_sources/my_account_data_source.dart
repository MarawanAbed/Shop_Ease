import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';

abstract class MyAccountRemoteDataSource {
  Stream<MyAccountModel> getSingleUser();

  Future<void> updateUser(Map<String, dynamic> data);

  Future<void> updateEmailAndPassword(String email,String oldPassowrd,String newPassword);
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
  Future<void> updateEmailAndPassword(String email,String newPassowrd,String oldPassword) async {
    await _authService.updateEmailAndPassword(
        newEmail: email, newPassword: newPassowrd, oldPassword: oldPassword
    );
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    await _databaseService.updateUser(data);
  }
}
