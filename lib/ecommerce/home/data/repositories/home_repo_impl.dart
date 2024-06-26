import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/home/data/data_sources/home_remote_data_source.dart';
import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';
import 'package:ecommerce/ecommerce/home/domain/repositories/home_repo.dart';

import '../../../../core/networking/exception.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl({required HomeRemoteDataSource homeRemoteDataSource})
      : _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<ApiResult<List<BannerModel>>> getBanner() async {
    try {
      final banners = await _homeRemoteDataSource.getBanner();
      return ApiResult.success(banners);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<ApiResult<List<CategoriesModel>>> getCategories(String language) async {
    try {
      final categories = await _homeRemoteDataSource.getCategories(language);
      return ApiResult.success(categories);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }



  @override
  Future<ApiResult<List<HomeProductModel>>> getProductsByCategories(
      int categoryId,String language) async {
    try {
      final products =
          await _homeRemoteDataSource.getProductsByCategories(categoryId,language);
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
