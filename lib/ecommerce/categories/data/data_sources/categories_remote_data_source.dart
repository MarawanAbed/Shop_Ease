import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiServices _apiServices;

  CategoriesRemoteDataSourceImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<List<CategoryModel>> getCategories() async {
    String language = getIt<LocalCubit>().state.language;
    final response = await _apiServices.getCategories(language);
    final categoriesJson = response['data']['data'] as List;
    return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
