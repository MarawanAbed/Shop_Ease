import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:ecommerce/ecommerce/categories/domain/repositories/categories_repo.dart';

import '../../../../core/networking/exception.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource categoriesDataSource;

  CategoriesRepoImpl({required this.categoriesDataSource});

  @override
  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final categories = await categoriesDataSource.getCategories();
      return ApiResult.success(categories);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }
}
