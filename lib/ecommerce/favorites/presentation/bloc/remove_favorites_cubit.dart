import 'package:ecommerce/ecommerce/favorites/domain/use_cases/remove_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'remove_favorites_state.dart';

class RemoveFavoritesCubit extends Cubit<RemoveFavoritesState> {
  RemoveFavoritesCubit(this._favorite) : super(RemoveFavoritesInitial());

  final RemoveFavorite _favorite;

  void removeFavorites(int id) {
    emit(RemoveFavoritesLoading());
    try {
      _favorite(id);
      emit(RemoveFavoritesSuccess());
    } catch (e) {
      emit(RemoveFavoritesFailure(e.toString()));
    }
  }
}
