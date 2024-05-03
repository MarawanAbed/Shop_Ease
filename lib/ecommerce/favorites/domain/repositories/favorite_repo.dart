
import '../../data/models/favorites_entity.dart';

abstract class FavoriteRepo {
  Future<void> addFavorite(FavoriteModel favorite);
  Future<List<FavoriteModel>> getFavorites();
  Future<void> removeFavorite(int id);
  Future<void> removeAllFavorites();
}