import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../../data/models/product.dart';
import '../repositories/home_repo.dart';

class GetProductByCategories implements UseCaseTwoParams<Future<ApiResult<List<HomeProductModel>>>, int,String> {
  final HomeRepo _repo;

  GetProductByCategories(this._repo);
  @override
  Future<ApiResult<List<HomeProductModel>>> call([int? parameter1,String ? parameter2])async {
    return await _repo.getProductsByCategories(parameter1!, parameter2!);
  }
}