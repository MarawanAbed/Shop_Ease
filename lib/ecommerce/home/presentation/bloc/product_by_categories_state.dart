part of 'product_by_categories_cubit.dart';

@freezed
class ProductByCategoriesState with _$ProductByCategoriesState {
  const factory ProductByCategoriesState.initial() = _Initial;


  const factory ProductByCategoriesState.loading() = Loading;


  const factory ProductByCategoriesState.loaded(List<HomeProductModel> products) = Loaded;


  const factory ProductByCategoriesState.error(String message) = Error;
}
