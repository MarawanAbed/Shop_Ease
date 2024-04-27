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
  );


  @POST('payment_intents')
  Future<Map<String, dynamic>> createPaymentIntent(
    @Header('Authorization') String bearerToken,
    @Body() Map<String, dynamic> paymentData,
  );
  
  @POST('ephemeral_keys')
  Future<Map<String, dynamic>> createEphemeralKey(
    @Header('Authorization') String bearerToken,
    @Body() Map<String, dynamic> keyData,
  );
}
