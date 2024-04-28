import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/stripe.dart';

import '../models/customer_model.dart';
import '../models/user_model.dart';


abstract class RegisterRemoteDataSource
{
  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void>createUser(UserModel userModel);

  Future<CustomerModel>createCustomer(CustomerModel customer);
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource
{
  final DatabaseService databaseService;
  final Strip stripe;
  final AuthService authService;

  RegisterRemoteDataSourceImpl({required this.databaseService, required this.stripe, required this.authService});
  @override
  Future<CustomerModel> createCustomer(CustomerModel customer)async {
    return await stripe.createCustomer(customer);
  }

  @override
  Future<void> createUser(UserModel userModel)async {
    return await databaseService.createUser(userModel);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async{
    await authService.signUp(email: email, password: password);
  }

}