import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_product_by_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/exception.dart';

part 'product_by_categories_state.dart';
part 'product_by_categories_cubit.freezed.dart';

class ProductByCategoriesCubit extends Cubit<ProductByCategoriesState> {
  ProductByCategoriesCubit(this._getProductByCategories) : super(const ProductByCategoriesState.initial());


  final GetProductByCategories _getProductByCategories;

  void getProductByCategories() async {
    emit(const ProductByCategoriesState.loading());
    final result = await _getProductByCategories(44);
    result.when(
      success: (List<HomeProductModel> data) {
        emit(ProductByCategoriesState.loaded(data));
      },
     failure: (Failures error) {
        emit(ProductByCategoriesState.error(error.message));
     },
    );
  }
}
