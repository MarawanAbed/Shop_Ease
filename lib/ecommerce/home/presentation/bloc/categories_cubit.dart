import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/exception.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._getCategories) : super(const CategoriesState.initial());

  final GetCategories _getCategories;

  final List<CategoriesModel> categories = [];
  void getCategories(String language) async {
    emit(const CategoriesState.loading());
    final result = await _getCategories(language);
    print(result);
    result.when(
      success: (List<CategoriesModel> data) {
        emit(CategoriesState.loaded(data));
      },
      failure: (Failures error) {
        emit(CategoriesState.error(error.message));
      },
    );
  }
}
