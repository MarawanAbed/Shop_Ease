import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/cart/data/models/payment_intents.dart';

import '../repositories/cart_repo.dart';

class CreatePaymentIntent implements UseCaseThreeParams<Future<ApiResult<PaymentIntents>>,String,String,String>
{
  final CartRepo _repo;

  CreatePaymentIntent(this._repo);
  @override
  Future<ApiResult<PaymentIntents>> call([String? param1, String? param2, String? param3])async {
    return await _repo.createPaymentIntent(amount: param1!, customerId: param2!, currency: param3!);
  }

}