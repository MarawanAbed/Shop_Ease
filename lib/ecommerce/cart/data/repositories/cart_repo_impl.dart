import 'package:ecommerce/ecommerce/cart/data/data_sources/local_data_source.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo
{
  final Future<CartLocalDataSource> cartLocalDataSource;

  CartRepoImpl(this.cartLocalDataSource);
  @override
  Future<void> addCart(CartModel cart) async{
    try
    {
      var dataSource = await cartLocalDataSource;
      await dataSource.addCart(cart);
    }
    catch(e)
    {
      rethrow;
    }
  }

  @override
  Future<void> removeCart(int id)async {
    try
    {
      var dataSource = await cartLocalDataSource;
      await dataSource.removeCart(id);
    }
    catch(e)
    {
      rethrow;
    }
  }

  @override
  Future<void> switchUserBox()async {
    try
    {
      var dataSource = await cartLocalDataSource;
      await dataSource.switchUserBox();
    }
    catch(e)
    {
      rethrow;
    }
  }

  @override
  Future<bool> isAlreadyInCart(int id)async {
    try
    {
      var dataSource = await cartLocalDataSource;
      return await dataSource.isAlreadyInCart(id);
    }
    catch(e)
    {
      rethrow;
    }
  }
}