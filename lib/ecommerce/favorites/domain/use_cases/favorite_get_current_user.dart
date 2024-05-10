import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

class FavoriteGetCurrentUserIdUseCase extends UseCase<String?, NoParameter> {
  final FavoriteRepo _repo;

  FavoriteGetCurrentUserIdUseCase(this._repo);

  @override
  String? call([NoParameter? parameter]) {
    return _repo.getCurrentUserId();
  }
}
