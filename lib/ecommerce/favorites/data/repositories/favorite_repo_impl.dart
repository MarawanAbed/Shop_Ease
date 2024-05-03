import 'package:ecommerce/ecommerce/favorites/data/data_sources/local_data_source.dart';
import 'package:ecommerce/ecommerce/favorites/domain/repositories/favorite_repo.dart';

import '../models/favorites_entity.dart';

class FavoriteRepoImpl implements FavoriteRepo
{
  final LocalDataSource localDataSource;

  FavoriteRepoImpl(this.localDataSource);
  @override
  Future<void> addFavorite(FavoriteModel favorite) async{
   try
   {
      await localDataSource.addFavorite(favorite);
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
      await localDataSource.removeFavorite(id);
    }
    catch(e)
    {
      rethrow;
    }
  }

}