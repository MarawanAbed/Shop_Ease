import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/home_details/data/data_sources/home_details_remote_data_source.dart';
import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';
import 'package:ecommerce/ecommerce/home_details/domain/repositories/home_details_repo.dart';

import '../../../../core/networking/exception.dart';

class HomeDetailsRepoImpl implements HomeDetailsRepo
{
  final HomeDetailsRemoteDataSource _homeDetailsRemoteDataSource;

  HomeDetailsRepoImpl(this._homeDetailsRemoteDataSource);


  @override
  Future<ApiResult<HomeDetailsProductModel>> getProductDetails(int id) async {
    try {
      final product = await _homeDetailsRemoteDataSource.getProductDetails(id);
      return ApiResult.success(product);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }

}