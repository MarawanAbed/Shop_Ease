import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<CategoryModel>>> getCategories(String language);
}
