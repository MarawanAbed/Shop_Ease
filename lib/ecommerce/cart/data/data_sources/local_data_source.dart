import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/services/firebase_servies.dart';
import '../models/cart_model.dart';

abstract class CartLocalDataSource
{
  Future<void> addCart(CartModel cart);
  Future<void> removeCart(int id);
  Future<void> switchUserBox();

  Future<bool> isAlreadyInCart(int id);
}

class CartLocalDataSourceImpl implements CartLocalDataSource
{
  late Box<CartModel> cartBox;

  CartLocalDataSourceImpl._();

  static Future<CartLocalDataSourceImpl> create() async {
    var instance = CartLocalDataSourceImpl._();
    await instance._openBox();
    return instance;
  }

  Future<void> _openBox() async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null) {
      cartBox = await Hive.openBox<CartModel>('cart_$uId');
    }
  }


  @override
  Future<void> switchUserBox()async {
    var uId = getIt<AuthService>().getCurrentUserId();
    if (uId != null && uId != 'default') {
      await cartBox.close();
      cartBox = await Hive.openBox<CartModel>('cart_$uId');
    }
  }
  @override
  Future<void> addCart(CartModel cart)async {
    await cartBox.add(cart);
  }

  @override
  Future<void> removeCart(int id)async {
    final index = cartBox.values.toList().indexWhere((element) => element.id == id);
    if (index != -1) {
      await cartBox.deleteAt(index);
    }
  }

  @override
  Future<bool> isAlreadyInCart(int id) async{
    return await cartBox.values.any((element) => element.id == id);
  }


}