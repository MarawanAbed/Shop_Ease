import '../../data/models/favorites_entity.dart';


import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

class AddFavorite implements UseCase<Future<void>,FavoriteModel>
{
  final FavoriteRepo favoriteRepo;

  AddFavorite(this.favoriteRepo);
  @override
  Future<void> call([FavoriteModel? parameter])async {
    return await favoriteRepo.addFavorite(parameter!);
  }
}