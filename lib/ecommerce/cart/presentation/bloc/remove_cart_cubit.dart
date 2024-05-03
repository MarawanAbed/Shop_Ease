import 'package:ecommerce/ecommerce/cart/domain/use_cases/remove_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'remove_cart_state.dart';

class RemoveCartCubit extends Cubit<RemoveCartState> {
  RemoveCartCubit(this._removeCart) : super(RemoveCartInitial());


  int quntity = 1;
  final RemoveCart _removeCart;
  void removeCart(int id) async {
    emit(RemoveCartLoading());
    try {
      await _removeCart(id);
      emit(RemoveCartSuccess());
    } catch (e) {
      emit(RemoveCartFailure(e.toString()));
    }
  }
}
