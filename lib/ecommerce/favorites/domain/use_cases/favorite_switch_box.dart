import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

class FavoriteSwitchBoxUseCase extends UseCase<Future<void>, NoParameter> {
  final FavoriteRepo _repo;

  FavoriteSwitchBoxUseCase(this._repo);

  @override
  Future<void> call([NoParameter? parameter]) async {
    return await _repo.favoriteSwitchUserBox();
  }
}
