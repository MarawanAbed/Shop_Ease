import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/repositories/register_repo.dart';

class SignUp implements UseCaseTwoParams<Future<void>,String,String>
{
  final RegisterRepo _registerRepo;

  SignUp({required RegisterRepo registerRepo}) : _registerRepo = registerRepo;
  @override
  Future<void> call([String? param1, String? param2])async {
    return await _registerRepo.signUpWithEmailAndPassword(param1!,param2!);
  }

}