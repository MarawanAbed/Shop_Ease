import 'package:ecommerce/ecommerce/auth/login/domain/repositories/login_repo.dart';

import '../../../../../core/usecases/use_cases.dart';

class GoogleSignInUseCase implements UseCase<Future<void>, NoParameter> {
  final LoginRepo _loginRepo;

  GoogleSignInUseCase({required LoginRepo loginRepo}) : _loginRepo = loginRepo;

  @override
  Future<void> call([NoParameter? parameter]) async{
    return await _loginRepo.googleSignIn();
  }
}