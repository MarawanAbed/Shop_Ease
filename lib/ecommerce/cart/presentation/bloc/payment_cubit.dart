import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/create_ephemeral_key.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/create_payment_intent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';

part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._paymentIntent, this._ephemeralKey) : super(const PaymentState.initial());

  final CreatePaymentIntent _paymentIntent;
  final CreateEphemeralKey _ephemeralKey;
  String clientSecret = '';
  String ephemeralKey = '';
  paymentIntent(String amount, String currency, String customerId) async
  {
    emit(const PaymentState.loading());
      var paymentIntent = await _paymentIntent(amount, customerId, currency);
      paymentIntent.when(
        success: (data)
        {
          clientSecret = data.clientSecret;
        },
        failure: (error)
        {
          emit(const PaymentState.error());
        },
      );
  }

  ephemeralKeyKey(String customerId) async
  {
    emit(const PaymentState.loading());
    var ephemeralKeyKey = await _ephemeralKey(customerId);
    ephemeralKeyKey.when(
      success: (data)
      {
        ephemeralKey = data.secret;
      },
      failure: (error)
      {
        emit(const PaymentState.error());
      },
    );
  }

  Future<void>checkOut(String customerId)
  async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters:
         SetupPaymentSheetParameters(
          customFlow: false,
          customerEphemeralKeySecret: ephemeralKey,
          customerId: customerId,
          // Main params
          merchantDisplayName: 'Marwan',
          paymentIntentClientSecret: clientSecret,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      emit(const PaymentState.loaded());
    }on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        HelperMethod.showErrorToast('Payment canceled',gravity: ToastGravity.BOTTOM);
      } else {
        HelperMethod.showErrorToast('Payment failed',gravity: ToastGravity.BOTTOM);
      }
    } catch (e) {
      HelperMethod.showErrorToast('Payment failed',gravity: ToastGravity.BOTTOM);
    }
  }

}
