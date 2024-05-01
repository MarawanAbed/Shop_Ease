part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;

  const factory ProductDetailsState.loading() = Loading;

  const factory ProductDetailsState.success(ProductModel product) = Success;

  const factory ProductDetailsState.error(String message) = Error;
}
