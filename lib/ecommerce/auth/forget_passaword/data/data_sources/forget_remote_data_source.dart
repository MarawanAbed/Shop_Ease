import '../../../../../core/services/firebase_servies.dart';

abstract class ForgetRemoteDataSource
{
  Future<void> forgetPassword(String email);
}

class ForgetRemoteDataSourceImpl extends ForgetRemoteDataSource
{
  final AuthService authService;

  ForgetRemoteDataSourceImpl({required this.authService});

  @override
  Future<void> forgetPassword(String email)async {
    await authService.forgetPassword(email);
  }

}