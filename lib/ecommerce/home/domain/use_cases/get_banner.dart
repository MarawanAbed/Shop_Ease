import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:ecommerce/ecommerce/home/domain/repositories/home_repo.dart';

import '../../../../core/networking/api_result.dart';

class GetBanner implements UseCase<Future<ApiResult<List<BannerModel>>>, NoParameter> {

  final HomeRepo _repo;

  GetBanner(this._repo);
  @override
  Future<ApiResult<List<BannerModel>>> call([NoParameter? parameter])async {
    return await _repo.getBanner();
  }

}