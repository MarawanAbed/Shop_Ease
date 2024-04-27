import 'package:ecommerce/ecommerce/auth/login/domain/repositories/login_repo.dart';
import 'package:flutter/material.dart';

import '../../../../../core/usecases/use_cases.dart';

class GitHubSignInUseCase implements UseCase<Future<void>, BuildContext> {
  final LoginRepo _loginRepo;

  GitHubSignInUseCase({required LoginRepo loginRepo}) : _loginRepo = loginRepo;

  @override
  Future<void> call([BuildContext? parameter]) async{
    return await _loginRepo.gitHubSignIn(parameter!);
  }
}