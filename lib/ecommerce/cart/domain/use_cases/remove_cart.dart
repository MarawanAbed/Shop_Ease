import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class RemoveCart implements UseCase<Future<void>, int> {
  final CartRepo repo;

  RemoveCart(this.repo);

  @override
  Future<void> call([int? parameter]) async {
    return await repo.removeCart(parameter!);
  }
}
