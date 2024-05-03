import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

class RemoveFavorite implements UseCase<Future<void>, int> {
  final FavoriteRepo favoriteRepo;

  RemoveFavorite(this.favoriteRepo);

  @override
  Future<void> call([int? parameter]) async {
    return await favoriteRepo.removeFavorite(parameter!);
  }
}
