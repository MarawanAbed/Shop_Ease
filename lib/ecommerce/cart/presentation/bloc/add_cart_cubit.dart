import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/add_cart.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/is_already_in_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit(this._addCart, this._isAlreadyInCart) : super(AddCartInitial());

  final AddCart _addCart;
  final IsAlreadyInCart _isAlreadyInCart;

  void addCart(CartModel cartModel) async {
    emit(AddCartLoading());
    try {
      await _addCart(cartModel);
      emit(AddCartSuccess());
    } catch (e) {
      emit(AddCartFailure(e.toString()));
    }
  }

  Future<bool> isAlreadyInCart(int id) async {
    emit(AddCartLoading());
    try {
      return await _isAlreadyInCart(id);
    } catch (e) {
      emit(AddCartFailure(e.toString()));
      return false;
    }
  }
}
