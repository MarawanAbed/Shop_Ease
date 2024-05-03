import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class IsAlreadyInCart implements UseCase<Future<bool>, int> {
  final CartRepo repo;

  IsAlreadyInCart(this.repo);

  @override
  Future<bool> call([int? parameter]) async {
    return await repo.isAlreadyInCart(parameter!);
  }
}
