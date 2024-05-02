import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

abstract class SearchRepo
{
  Future<ApiResult<List<ProductsModel>>> searchProducts(String text);

}