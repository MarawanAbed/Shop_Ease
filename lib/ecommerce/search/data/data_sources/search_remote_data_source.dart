import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

import '../../../translate/presentation/bloc/translate/translate_cubit.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductsByCategoriesProductsModel>> searchProducts(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiServices _apiServices;

  SearchRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<List<ProductsByCategoriesProductsModel>> searchProducts(String text) async {
    String language = getIt<LocalCubit>().state.language;
    final response =
        await _apiServices.searchProducts(language, AppSecured.token, text);
    final productsJson = response['data']['data'] as List;
    return productsJson.map((e) => ProductsByCategoriesProductsModel.fromJson(e)).toList();
  }
}
