import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/data/models/product.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../translate/presentation/bloc/translate/translate_cubit.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanner();

  Future<List<CategoriesModel>> getCategories();

  Future<List<HomeProductModel>> getProductsByCategories(
       int categoryId);


}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<List<BannerModel>> getBanner() async {
    final response = await _apiServices.getBanner();
    final bannerJson = response['data'] as List;
    return bannerJson.map((e) => BannerModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    String language = getIt<LocalCubit>().state.language;
    final response = await _apiServices.getCategories(language);
    final categoriesJson = response['data']['data'] as List;
    return categoriesJson.map((e) => CategoriesModel.fromJson(e)).toList();
  }



  @override
  Future<List<HomeProductModel>> getProductsByCategories(
       int categoryId) async {
    String language = getIt<LocalCubit>().state.language;
    final response = await _apiServices.getProductsByCategories(
        language, AppSecured.token, categoryId);
    final productsJson = response['data']['data'] as List;
    return productsJson.map((e) => HomeProductModel.fromJson(e)).toList();
  }
}
