import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../../core/utils/app_secured.dart';
import '../../../translate/presentation/bloc/translate/translate_cubit.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductsByCategoriesProductsModel>> getProductsByCategories(int categoryId);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {

  final ApiServices _apiServices;

  ProductsRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<List<ProductsByCategoriesProductsModel>> getProductsByCategories(
      int categoryId) async {
    String language = getIt<LocalCubit>().state.language;
    final response = await _apiServices.getProductsByCategories(
        language, AppSecured.token, categoryId);
    final productsJson = response['data']['data'] as List;
    return productsJson.map((e) => ProductsByCategoriesProductsModel.fromJson(e)).toList();
  }
}