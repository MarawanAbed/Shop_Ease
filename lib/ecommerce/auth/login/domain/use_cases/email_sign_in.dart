import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/repositories/login_repo.dart';

class EmailSignIn implements UseCaseTwoParams<Future<void>,String,String>
{
  final LoginRepo _loginRepo;

  EmailSignIn({required LoginRepo loginRepo}) : _loginRepo = loginRepo;
  @override
  Future<void> call([String? param1, String? param2])async {
    return await _loginRepo.signInWithEmailAndPassword(param1!, param2!);
  }

}