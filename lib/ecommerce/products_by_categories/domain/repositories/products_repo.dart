import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

abstract class ProductsRepo {
  Future<ApiResult<List<ProductsModel>>> getProductsByCategories(int categoryId);
}