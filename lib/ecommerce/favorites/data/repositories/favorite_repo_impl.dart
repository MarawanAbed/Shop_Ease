import 'package:ecommerce/ecommerce/favorites/data/data_sources/local_data_source.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

import '../models/favorites_entity.dart';

class FavoriteRepoImpl implements FavoriteRepo
{
  final Future<LocalDataSource> localDataSource;

  FavoriteRepoImpl(this.localDataSource);
  @override
  Future<void> addFavorite(FavoriteModel favorite) async{
   try
   {
     var dataSource = await localDataSource;
     await dataSource.addFavorite(favorite);
    }
    catch(e)
    {
      rethrow;
   }
  }



  @override
  Future<void> removeFavorite(int id) async{
    try
    {
      var dataSource = await localDataSource;

      await dataSource.removeFavorite(id);
    }
    catch(e)
    {
      rethrow;
    }
  }

  @override
  Future<void> favoriteSwitchUserBox() async{
    try
    {
      var dataSource = await localDataSource;
      await dataSource.switchUserBox();
    }
    catch(e)
    {
      rethrow;
    }
  }
}