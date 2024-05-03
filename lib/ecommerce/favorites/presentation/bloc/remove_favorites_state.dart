part of 'remove_favorites_cubit.dart';

@immutable
sealed class RemoveFavoritesState {}

final class RemoveFavoritesInitial extends RemoveFavoritesState {}


final class RemoveFavoritesLoading extends RemoveFavoritesState {}


final class RemoveFavoritesSuccess extends RemoveFavoritesState {}

final class RemoveFavoritesFailure extends RemoveFavoritesState {
  final String message;

  RemoveFavoritesFailure(this.message);
}