import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/data/models/ephemeral_keys.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class CreateEphemeralKey implements UseCase<Future<ApiResult<EphemeralKeysModel>>,String>
{
  final CartRepo _repo;

  CreateEphemeralKey(this._repo);
  @override
  Future<ApiResult<EphemeralKeysModel>> call([String? parameter]) async{
    return await _repo.createEphemeralKey(customerId: parameter!);
  }

}