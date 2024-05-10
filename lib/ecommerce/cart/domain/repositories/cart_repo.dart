import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/data/models/ephemeral_keys.dart';
import 'package:ecommerce/ecommerce/cart/data/models/payment_intents.dart';

abstract class CartRepo {
  Future<void> addCart(CartModel cart);
  Future<void> removeCart(int id);

  Future<void> switchUserBox();
  Future<bool> isAlreadyInCart(int id);

  String? getCurrentUserId();
  Future<ApiResult<EphemeralKeysModel>> createEphemeralKey({required String customerId});

  Future<ApiResult<PaymentIntents>> createPaymentIntent(
      {required String amount,
        required String customerId,
        required String currency});
}
