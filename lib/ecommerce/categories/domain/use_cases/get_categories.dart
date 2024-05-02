import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/categories/data/models/categories.dart';
import 'package:ecommerce/ecommerce/categories/domain/repositories/categories_repo.dart';

import '../../../../core/networking/api_result.dart';

class CategoriesUseCase implements UseCase<Future<ApiResult<List<CategoryModel>>>, NoParameter> {

  final CategoriesRepo _repo;

  CategoriesUseCase(this._repo);
  @override
  Future<ApiResult<List<CategoryModel>>> call([NoParameter? parameter])async {
    return await _repo.getCategories();
  }

}