import 'package:ecommerce/ecommerce/auth/forget_passaword/data/data_sources/forget_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/domain/repositories/forget_repo.dart';

class ForgetRepoImpl implements ForgetRepo
{
  final ForgetRemoteDataSource dataSource;

  ForgetRepoImpl({required this.dataSource});

  @override
  Future<void> forgetPassword(String email) async
  {
     try {
       await dataSource.forgetPassword(email);
     }  catch (e) {
        rethrow;
     }
  }
}