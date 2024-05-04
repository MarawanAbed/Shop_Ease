import '../../../../core/networking/api_result.dart';
import '../../../../core/usecases/use_cases.dart';
import '../../../home_details/data/models/product.dart';
import '../repositories/home_details_repo.dart';

class GetProductDetails implements UseCaseTwoParams<Future<ApiResult<HomeDetailsProductModel>>, int,String> {
  final HomeDetailsRepo _repo;

  GetProductDetails(this._repo);
  @override
  Future<ApiResult<HomeDetailsProductModel>> call([int? parameter1,String ? parameter2])async {
    return await _repo.getProductDetails(parameter1!,parameter2!);
  }
}