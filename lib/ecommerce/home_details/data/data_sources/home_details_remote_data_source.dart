import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';

abstract class HomeDetailsRemoteDataSource {
  Future<HomeDetailsProductModel> getProductDetails(int id, String language);
}

class HomeDetailsRemoteDataSourceImpl implements HomeDetailsRemoteDataSource {
  final ApiServices _apiServices;

  HomeDetailsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<HomeDetailsProductModel> getProductDetails(int id, language) async {
    final response = await _apiServices.getProductDetails(
        language, AppSecured.authToken, id);
    return HomeDetailsProductModel.fromJson(response['data']);
  }
}
