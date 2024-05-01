import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';

import '../../../../core/networking/api_result.dart';

abstract class HomeDetailsRepo {
  Future<ApiResult<ProductModel>> getProductDetails( int id);
}