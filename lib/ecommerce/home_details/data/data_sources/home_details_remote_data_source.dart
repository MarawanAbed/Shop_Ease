import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';

abstract class HomeDetailsRemoteDataSource {
  Future<HomeDetailsProductModel> getProductDetails(int id, String language);
  String?  getCurrentUserId();
}

class HomeDetailsRemoteDataSourceImpl implements HomeDetailsRemoteDataSource {
  final ApiServices _apiServices;
  final AuthService _authServices;
  HomeDetailsRemoteDataSourceImpl(this._apiServices, this._authServices);

  @override
  Future<HomeDetailsProductModel> getProductDetails(int id, language) async {
    final response = await _apiServices.getProductDetails(
        language, AppSecured.authToken, id);
    return HomeDetailsProductModel.fromJson(response['data']);
  }

  @override
  String? getCurrentUserId() {
    return _authServices.getCurrentUserId();
  }


}
