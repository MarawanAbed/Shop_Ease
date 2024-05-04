
import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/core/networking/exception.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/data_sources/products_remote_data_source.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

import '../../domain/repositories/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource productsDataSource;

  ProductsRepoImpl({required this.productsDataSource});

  @override
  Future<ApiResult<List<ProductsByCategoriesProductsModel>>> getProductsByCategories(
      int categoryId,String language) async {
    try {
      final products =
      await productsDataSource.getProductsByCategories(categoryId,language);
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