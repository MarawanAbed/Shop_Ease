import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';

abstract class MyAccountRepo {
  Stream<MyAccountModel> getSingleUser();

  Future<void> updateUser(Map<String, dynamic> data);

  Future<void> updateEmailAndPassword(
      String email, String newPassowrd, String oldPassword);

  String? getUserUid();
}
