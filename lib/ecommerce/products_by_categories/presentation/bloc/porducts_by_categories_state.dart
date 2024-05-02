part of 'porducts_by_categories_cubit.dart';

@freezed
class ProductsByCategoriesState with _$ProductsByCategoriesState {
  const factory ProductsByCategoriesState.initial() = _Initial;

  const factory ProductsByCategoriesState.loading() = Loading;

  const factory ProductsByCategoriesState.loaded(List<ProductsByCategoriesProductsModel> products) = Loaded;

  const factory ProductsByCategoriesState.error(String message) = Error;
}
