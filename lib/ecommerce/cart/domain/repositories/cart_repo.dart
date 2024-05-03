import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';

abstract class CartRepo {
  Future<void> addCart(CartModel cart);
  Future<void> removeCart(int id);

  Future<void> switchUserBox();
  Future<bool> isAlreadyInCart(int id);
}