import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/profile/my_account/data/models/my_account.dart';

import '../repositories/my_account_repo.dart';

class GetUser extends UseCase<Stream<MyAccountModel>,NoParameter>
{
  final MyAccountRepo _repo;

  GetUser(this._repo);

  @override
  Stream<MyAccountModel> call([NoParameter ?parameter]) {
    return _repo.getSingleUser();
  }
}
