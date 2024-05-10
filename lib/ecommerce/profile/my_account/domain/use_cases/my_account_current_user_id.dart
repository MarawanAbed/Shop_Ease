import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/repositories/my_account_repo.dart';

class MyAccountGetCurrentUserIdUseCase extends UseCase<String?, NoParameter> {
  final MyAccountRepo _repo;

  MyAccountGetCurrentUserIdUseCase(this._repo);

  @override
  String? call([NoParameter? parameter]) {
    return _repo.getUserUid();
  }
}
