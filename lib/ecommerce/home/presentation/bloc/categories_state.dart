part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;


  const factory CategoriesState.loading() = Loading;


  const factory CategoriesState.loaded(List<CategoriesModel> categories) = Loaded;


  const factory CategoriesState.error(String message) = Error;
}
