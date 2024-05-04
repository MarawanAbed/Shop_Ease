import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/repositories/my_account_repo.dart';

class UpdateUserData extends UseCase<Future<void>,Map<String,dynamic>>
{

  final MyAccountRepo _repo;

  UpdateUserData(this._repo);

  @override
  Future<void> call([Map<String,dynamic> ?parameter]) async{
    return await _repo.updateUser(parameter!);
  }
}

