import 'package:ecommerce/ecommerce/favorites/domain/use_cases/add_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/favorites_entity.dart';

part 'add_favorite_state.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  AddFavoriteCubit(this.addFavorite) : super(AddFavoriteInitial());

  final AddFavorite addFavorite;

  void addFavorites(FavoriteModel favorite) {
    emit(AddFavoriteLoading());
    addFavorite(favorite).then((value) {
      emit(AddFavoriteSuccess());
    }).catchError((error) {
      emit(AddFavoriteFailure(error.toString()));
    });
  }


}
