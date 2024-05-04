import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:ecommerce/ecommerce/search/domain/use_cases/search_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchProduct) : super(const SearchState.initial());


  final SearchProduct _searchProduct;

  Future<void> searchProducts(String text,String language) async {
    emit(const SearchState.loading());
    final result = await _searchProduct(text,language);
    result.when(
      success: (products) {
        emit(SearchState.success(products));
      },
      failure: (message) {
        emit(SearchState.error(message.message));
      },
    );
  }
}
