part of 'remove_cart_cubit.dart';

@immutable
sealed class RemoveCartState {}

final class RemoveCartInitial extends RemoveCartState {}


final class RemoveCartLoading extends RemoveCartState {}


final class RemoveCartSuccess extends RemoveCartState {

}

final class RemoveCartFailure extends RemoveCartState {
  final String message;

  RemoveCartFailure(this.message);
}
