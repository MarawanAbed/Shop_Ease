import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import '../../data/models/favorites_entity.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource
{
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int id);
  Future<void> switchUserBox();
}

class LocalDataSourceImpl extends LocalDataSource
{
  late Box<FavoriteModel> favoriteBox;

  LocalDataSourceImpl._();

  static Future<LocalDataSourceImpl> create() async {
    var instance = LocalDataSourceImpl._();
    await instance._openBox();
    return instance;
  }

  Future<void> _openBox() async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null) {
      favoriteBox = await Hive.openBox<FavoriteModel>('favorite_$uId');
    }
  }
  @override
  Future<void> switchUserBox() async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null && uId != 'default') {
      await favoriteBox.close();
      favoriteBox = await Hive.openBox<FavoriteModel>('favorite_$uId');
    }
  }
  @override
  Future<void> addFavorite(FavoriteModel favorite) async
  {
    await favoriteBox.add(favorite);
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