import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/core/networking/exception.dart';
import 'package:ecommerce/ecommerce/search/data/data_sources/search_remote_data_source.dart';
import 'package:ecommerce/ecommerce/search/domain/repositories/search_repo.dart';

import '../../../products_by_categories/data/models/product.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<ApiResult<List<ProductsByCategoriesProductsModel>>> searchProducts(String text) async {
    try {
      final products = await searchDataSource.searchProducts(text);
      return ApiResult.success(products);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }
}
