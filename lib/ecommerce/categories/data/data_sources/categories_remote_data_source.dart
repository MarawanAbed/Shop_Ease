import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories(String language);
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiServices _apiServices;

  CategoriesRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<List<CategoryModel>> getCategories(String language) async {
    final response = await _apiServices.getCategories(language);
    final categoriesJson = response['data']['data'] as List;
    return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
