import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductsByCategoriesProductsModel>> searchProducts(
      String query, String language);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiServices _apiServices;

  SearchRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<List<ProductsByCategoriesProductsModel>> searchProducts(
      String text, language) async {
    final response =
        await _apiServices.searchProducts(language, AppSecured.token, text);
    final productsJson = response['data']['data'] as List;
    return productsJson
        .map((e) => ProductsByCategoriesProductsModel.fromJson(e))
        .toList();
  }
}
