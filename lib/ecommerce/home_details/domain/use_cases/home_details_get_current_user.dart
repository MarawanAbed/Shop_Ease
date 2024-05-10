import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/home_details/domain/repositories/home_details_repo.dart';

class HomeDetailsGetCurrentUserIdUseCase extends UseCase<String?, NoParameter> {
  final HomeDetailsRepo _repo;

  HomeDetailsGetCurrentUserIdUseCase(this._repo);

  @override
  String? call([NoParameter? parameter]) {
    return _repo.getCurrentUserId();
  }
}
