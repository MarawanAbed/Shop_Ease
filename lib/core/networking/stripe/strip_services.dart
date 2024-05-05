import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'strip_services.g.dart';

@RestApi(baseUrl: Constant.stripBaseUrl)
abstract class StripServices {
  factory StripServices(Dio dio, {String baseUrl}) = _StripServices;

  @POST('customers')
  Future<Map<String, dynamic>> createCustomers(
    @Header('Authorization') String bearerToken,
    @Body() Map<String, dynamic> customerData,
    @Header('Content-Type') String contentType,
  );

  @POST('payment_intents')
  Future<Map<String, dynamic>> createPaymentIntent(
    @Header('Authorization') String bearerToken,
    @Body() Map<String, dynamic> paymentData,
    @Header('Content-Type') String contentType,
  );

  @POST('ephemeral_keys')
  Future<Map<String, dynamic>> createEphemeralKey(
    @Header('Authorization') String bearerToken,
    @Header('Stripe-Version') String stripeVersion,
    @Body() Map<String, dynamic> keyData,
    @Header('Content-Type') String contentType,
  );
}
