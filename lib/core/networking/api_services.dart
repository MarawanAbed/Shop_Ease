import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../utils/constant.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: Constant.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('banners')
  Future<Map<String, dynamic>> getBanner();

  @GET('categories')
  Future<Map<String, dynamic>> getCategories(
    @Header('lang') String lang,
  );

  @GET('products')
  Future<Map<String, dynamic>> getProductsByCategories(
    @Header('lang') String lang,
    @Header('Authorization') String token,
    @Query('category_id') int categoryId,
  );

  @POST('products/search')
  Future<Map<String, dynamic>> searchProducts(
    @Header('lang') String lang,
    @Header('Authorization') String token,
    @Body() String text,
  );

  @GET('products/{id}')
  Future<Map<String, dynamic>> getProductDetails(
    @Header('lang') String lang,
    @Header('Authorization') String token,
    @Path('id') int id,
  );
}
