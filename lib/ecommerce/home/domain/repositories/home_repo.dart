import 'package:ecommerce/core/networking/api_result.dart';

import '../../data/models/banner.dart';
import '../../data/models/categories.dart';
import '../../data/models/product.dart';

abstract class HomeRepo
{
  Future<ApiResult<List<BannerModel>>> getBanner();
  Future<ApiResult<List<CategoriesModel>>> getCategories();
  Future<ApiResult<List<HomeProductModel>>> getProductsByCategories( int categoryId);
}