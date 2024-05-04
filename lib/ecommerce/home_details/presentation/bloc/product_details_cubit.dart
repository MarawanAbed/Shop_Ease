import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';
import 'package:ecommerce/ecommerce/home_details/domain/use_cases/get_porduct_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_cubit.freezed.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetails)
      : super(const ProductDetailsState.initial());

  final GetProductDetails _productDetails;
  int counter=1;

  void getProductDetails(int id,String language) async {
    emit(const ProductDetailsState.loading());
    final result = await _productDetails(id,language);
    result.when(
      success: (product) {
        emit(ProductDetailsState.success(product));
      },
      failure: (error) {
        emit(ProductDetailsState.error(error.message));
      },
    );
  }
}
