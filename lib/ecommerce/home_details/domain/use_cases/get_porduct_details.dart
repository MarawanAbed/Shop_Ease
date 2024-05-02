import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../../../home_details/data/models/product.dart';
import '../repositories/home_details_repo.dart';

class GetProductDetails implements UseCase<Future<ApiResult<HomeDetailsProductModel>>, int> {
  final HomeDetailsRepo _repo;

  GetProductDetails(this._repo);
  @override
  Future<ApiResult<HomeDetailsProductModel>> call([int? parameter])async {
    return await _repo.getProductDetails(parameter!);
  }
}