import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/products_by_categories/data/models/product.dart';
import 'package:ecommerce/ecommerce/products_by_categories/domain/repositories/products_repo.dart';

import '../../../../core/networking/api_result.dart';

class ProductsByCategories
    implements UseCaseTwoParams<Future<ApiResult<List<ProductsByCategoriesProductsModel>>>, int,String> {
  final ProductsRepo _repo;

  ProductsByCategories(this._repo);

  @override
  Future<ApiResult<List<ProductsByCategoriesProductsModel>>> call([int? parameter1,String? parameter2]) async {
    return await _repo.getProductsByCategories(parameter1!,parameter2!);
  }
}
