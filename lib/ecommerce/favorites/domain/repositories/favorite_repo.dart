
import '../../data/models/favorites_entity.dart';

abstract class FavoriteRepo {
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int id);
}