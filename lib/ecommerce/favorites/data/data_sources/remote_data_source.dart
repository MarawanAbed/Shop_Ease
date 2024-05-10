import 'package:ecommerce/core/services/firebase_servies.dart';

abstract class FavoriteRemoteDataSource
{

  String? getCurrentUserId();
}


class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource
{
  final AuthService authService;

  FavoriteRemoteDataSourceImpl(this.authService);
  @override
  String? getCurrentUserId() {
    return authService.getCurrentUserId();
  }

}