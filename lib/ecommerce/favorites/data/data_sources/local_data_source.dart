import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import '../../data/models/favorites_entity.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource
{
  Future<void> addFavorite(FavoriteModel favorite);
  Future<List<FavoriteModel>> getFavorites();
  Future<void> removeFavorite(int id);
  Future<void> removeAllFavorites();
  Future<void> switchUserBox();
}

class LocalDataSourceImpl extends LocalDataSource
{
  late Box<FavoriteModel> favoriteBox;

  LocalDataSourceImpl()
  {
    _openBox();
  }

  Future<void> _openBox() async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null) {
      favoriteBox = await Hive.openBox<FavoriteModel>(uId);
    }
  }
  @override
  Future<void> switchUserBox() async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null && uId != 'default') {
      await favoriteBox.close();
      favoriteBox = await Hive.openBox<FavoriteModel>(uId);
    }
  }
  @override
  Future<void> addFavorite(FavoriteModel favorite) async
  {
    await favoriteBox.add(favorite);
  }

  @override
  Future<List<FavoriteModel>> getFavorites() async
  {
    return favoriteBox.values.toList();
  }

  @override
  Future<void> removeAllFavorites() async
  {
    await favoriteBox.clear();
  }

  @override
  Future<void> removeFavorite(int id) async
  {
    final index = favoriteBox.values.toList().indexWhere((element) => element.id == id);
    if (index != -1) {
      await favoriteBox.deleteAt(index);
    }
  }
}