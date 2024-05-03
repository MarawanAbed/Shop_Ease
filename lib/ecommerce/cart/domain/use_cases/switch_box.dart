import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class SwitchBoxUseCase extends UseCase<Future<void>,NoParameter>
{
  final CartRepo _repo;

  SwitchBoxUseCase(this._repo);
  @override
  Future<void> call([NoParameter? parameter])async {
    return await _repo.switchUserBox();
  }

}