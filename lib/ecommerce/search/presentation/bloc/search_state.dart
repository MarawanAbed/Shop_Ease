part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = Loading;

  const factory SearchState.success(List<ProductsByCategoriesProductsModel> products) = Success;


  const factory SearchState.error(String message) = Error;
}
