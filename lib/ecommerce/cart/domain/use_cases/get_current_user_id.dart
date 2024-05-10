import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class GetCurrentUserIdUseCase extends UseCase<String?,NoParameter>
{
  final CartRepo _repo;

  GetCurrentUserIdUseCase(this._repo);
  @override
  String? call([NoParameter? parameter]) {
    return  _repo.getCurrentUserId();
  }

}