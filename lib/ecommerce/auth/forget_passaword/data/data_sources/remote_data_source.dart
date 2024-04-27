import '../../../../../core/services/firebase_servies.dart';

abstract class RemoteDataSource
{
  Future<void> forgetPassword(String email);
}

class RemoteDataSourceImpl extends RemoteDataSource
{
  final AuthService authService;

  RemoteDataSourceImpl({required this.authService});

  @override
  Future<void> forgetPassword(String email)async {
    await authService.forgetPassword(email);
  }

}