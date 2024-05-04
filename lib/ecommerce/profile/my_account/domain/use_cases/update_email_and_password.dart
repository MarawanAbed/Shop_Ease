import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/repositories/my_account_repo.dart';
import 'package:flutter/material.dart';

class UpdateEmailAndPassword extends UseCaseThreeParams<Future<void>,String,String,BuildContext>
{
  final MyAccountRepo myAccountRepo;

  UpdateEmailAndPassword(this.myAccountRepo);
  @override
  Future<void> call([String? param1, String? param2,BuildContext ? param3])async {
    return await myAccountRepo.updateEmailAndPassword(email: param1!, password: param2!,context: param3!);
  }

}