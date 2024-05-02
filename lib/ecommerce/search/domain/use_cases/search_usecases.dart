
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/search_repo.dart';

class SearchProduct implements UseCase<Future<ApiResult<List<ProductsByCategoriesProductsModel>>>, String> {
  final SearchRepo _repo;

  SearchProduct(this._repo);
  @override
  Future<ApiResult<List<ProductsByCategoriesProductsModel>>> call([String? parameter])async {
    return await _repo.searchProducts(parameter!);
  }
}