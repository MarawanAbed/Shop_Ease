import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/data/models/categories.dart';
import 'package:ecommerce/ecommerce/home/domain/repositories/home_repo.dart';

import '../../../../core/networking/api_result.dart';

class GetCategories implements UseCase<Future<ApiResult<List<CategoriesModel>>>, NoParameter> {

  final HomeRepo _repo;

  GetCategories(this._repo);
  @override
  Future<ApiResult<List<CategoriesModel>>> call([NoParameter? parameter])async {
    return await _repo.getCategories();
  }

}