import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../../data/models/product.dart';
import '../repositories/home_repo.dart';

class GetProductDetails implements UseCase<Future<ApiResult<ProductModel>>, int> {
  final HomeRepo _repo;

  GetProductDetails(this._repo);
  @override
  Future<ApiResult<ProductModel>> call([int? parameter])async {
    return await _repo.getProductDetails(parameter!);
  }
}