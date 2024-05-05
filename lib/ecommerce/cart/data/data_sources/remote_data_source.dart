import 'package:ecommerce/core/services/stripe.dart';
import 'package:ecommerce/ecommerce/cart/data/models/ephemeral_keys.dart';
import 'package:ecommerce/ecommerce/cart/data/models/payment_intents.dart';

abstract class CartRemoteDataSource {
  Future<EphemeralKeysModel> createEphemeralKey({required String customerId});

  Future<PaymentIntents> createPaymentIntent(
      {required String amount,
      required String customerId,
      required String currency});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Strip _strip;

  CartRemoteDataSourceImpl(this._strip);

  @override
  Future<EphemeralKeysModel> createEphemeralKey(
      {required String customerId}) async {
    return await _strip.createEphemeralKey(customerId: customerId);
  }

  @override
  Future<PaymentIntents> createPaymentIntent(
      {required String amount,
      required String customerId,
      required String currency}) async{
    return await _strip.createPaymentIntent(amount: amount, customerId: customerId, currency: currency);
  }
}
