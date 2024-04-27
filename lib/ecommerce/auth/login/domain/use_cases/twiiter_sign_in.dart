import 'package:ecommerce/ecommerce/auth/login/domain/repositories/login_repo.dart';

import '../../../../../core/usecases/use_cases.dart';

class TwitterSignIn implements UseCase<Future<void>, NoParameter> {
  final LoginRepo _loginRepo;

  TwitterSignIn({required LoginRepo loginRepo}) : _loginRepo = loginRepo;

  @override
  Future<void> call([NoParameter? parameter]) async{
    return await _loginRepo.twitterSignIn();
  }
}