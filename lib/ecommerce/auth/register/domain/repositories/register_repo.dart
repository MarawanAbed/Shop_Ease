import '../../data/models/customer_model.dart';
import '../../data/models/user_model.dart';

abstract class RegisterRepo {
  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> createUser(UserModel userModel);

  Future<CustomerModel> createCustomer(CustomerModel customer);
}