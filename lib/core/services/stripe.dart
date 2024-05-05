import 'package:ecommerce/core/networking/stripe/strip_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/customer_model.dart';
import 'package:ecommerce/ecommerce/cart/data/models/ephemeral_keys.dart';
import 'package:ecommerce/ecommerce/cart/data/models/payment_intents.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Strip {
  final StripServices _stripeServices;

  Strip(this._stripeServices);

  //
  Future<PaymentIntents> createPaymentIntent(
      {required String amount,
      required String customerId,
      required String currency}) async {
    //call api to create payment intent
    //return payment intent objectb
    var response = await _stripeServices.createPaymentIntent(
      AppSecured.token,
      {
        'amount': amount,
        'currency': currency,
        'customer': customerId,
      },
      'application/x-www-form-urlencoded',
    );
    return PaymentIntents.fromJson(response);
  }

  //
  Future<void> initPaymentSheet(
      {required String paymentSecret,
      required String customerEphemeralKeySecret,
      required String customerId}) async {
    try {
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          customerEphemeralKeySecret: customerEphemeralKeySecret,
          customerId: customerId,
          // Main params
          merchantDisplayName: 'Marwan',
          paymentIntentClientSecret: paymentSecret,
        ),
      );
    } catch (e) {
      print('Error initPaymentSheet ${e.toString()}');
    }
  }

  Future displayPaymentSheet() async {
    return await Stripe.instance.presentPaymentSheet();
  }

  Future checkout(
      {required String amount,
      required String customerId,
      required String currency,
      required String customerEphemeralKeySecret}) async {
    //1-create payment intent
    var paymentIntent = await createPaymentIntent(
        amount: amount, customerId: customerId, currency: currency);
    var customerEphemeralKeySecret =
        await createEphemeralKey(customerId: customerId);

    //2-init payment sheet
    await initPaymentSheet(
        paymentSecret: paymentIntent.clientSecret,
        customerEphemeralKeySecret: customerEphemeralKeySecret.secret,
        customerId: customerId);
    //3-display payment sheet
    await displayPaymentSheet();
  }

  Future<CustomerModel> createCustomer(CustomerModel customerInput) async {
    var response = await _stripeServices.createCustomers(AppSecured.token,
        customerInput.toJson(), 'application/x-www-form-urlencoded');
    return CustomerModel.fromJson(response);
  }



  Future<EphemeralKeysModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _stripeServices.createEphemeralKey(
      AppSecured.token,
      '2023-10-16',
      {'customer': customerId},
      'application/x-www-form-urlencoded',
    );

    return EphemeralKeysModel.fromJson(response);
  }
}
