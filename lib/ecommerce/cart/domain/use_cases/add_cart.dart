import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class AddCart implements UseCase<Future<void>, CartModel> {
  final CartRepo repo;

  AddCart(this.repo);

  @override
  Future<void> call([CartModel? parameter]) async {
    return await repo.addCart(parameter!);
  }
}
