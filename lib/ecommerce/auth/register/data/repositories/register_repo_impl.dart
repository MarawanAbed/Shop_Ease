import 'package:ecommerce/ecommerce/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/customer_model.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/user_model.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/repositories/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource _registerRemoteDataSource;

  RegisterRepoImpl({required RegisterRemoteDataSource registerRemoteDataSource})
      : _registerRemoteDataSource = registerRemoteDataSource;

  @override
  Future<CustomerModel> createCustomer(CustomerModel customer)async {
    try {
      return await _registerRemoteDataSource.createCustomer(customer);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createUser(UserModel userModel)async {
    try {
      await _registerRemoteDataSource.createUser(userModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async{
    try {
      await _registerRemoteDataSource.signUpWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
