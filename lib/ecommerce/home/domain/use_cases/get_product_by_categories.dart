import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../../data/models/product.dart';
import '../repositories/home_repo.dart';

class GetProductByCategories implements UseCase<Future<ApiResult<List<HomeProductModel>>>, int> {
  final HomeRepo _repo;

  GetProductByCategories(this._repo);
  @override
  Future<ApiResult<List<HomeProductModel>>> call([int? parameter])async {
    return await _repo.getProductsByCategories(parameter!);
  }
}