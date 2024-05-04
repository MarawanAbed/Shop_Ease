import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:ecommerce/ecommerce/products_by_categories/domain/use_cases/get_product_by_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_by_categories_state.dart';
part 'products_by_categories_cubit.freezed.dart';

class ProductsByCategoriesCubit extends Cubit<ProductsByCategoriesState> {
  ProductsByCategoriesCubit(this._productsByCategories) : super(const ProductsByCategoriesState.initial());


  final ProductsByCategories _productsByCategories;


  Future<void> getProductsByCategories(int id,String language) async {
    emit(const ProductsByCategoriesState.loading());
    final result = await _productsByCategories(id,language);
    result.when(
      success: (products) {
        emit(ProductsByCategoriesState.loaded(products));
      },
      failure: (message) {
        emit(ProductsByCategoriesState.error(message.message));
      },
    );
  }

  @override
  void emit( state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
