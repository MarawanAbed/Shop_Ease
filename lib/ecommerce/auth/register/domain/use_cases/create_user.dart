import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/repositories/register_repo.dart';

import '../../data/models/user_model.dart';

class CreateUser implements UseCase<Future<void>,UserModel>
{
  final RegisterRepo _registerRepo;

  CreateUser({required RegisterRepo registerRepo}) : _registerRepo = registerRepo;
  @override
  Future<void> call([UserModel? parameter])async {
    return await _registerRepo.createUser(parameter!);
  }

}