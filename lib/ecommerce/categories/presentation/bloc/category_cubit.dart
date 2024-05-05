import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:ecommerce/ecommerce/categories/domain/use_cases/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoriesUseCase) : super(const CategoryState.initial());

  final CategoriesUseCase _categoriesUseCase;


  bool isLoaded = false;
  void getCategories(String language) async {
    if (!isLoaded) {
      emit(const CategoryState.loading());
      final result = await _categoriesUseCase(language);
      result.when(
        success: (List<CategoryModel> categories) {
          isLoaded = true;
          emit(CategoryState.loaded(categories));
        },
        failure: (message) {
          emit(CategoryState.error(message.message));
        },
      );
    }
  }

  @override
  void emit( state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
