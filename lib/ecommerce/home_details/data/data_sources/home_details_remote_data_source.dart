import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce/home_details/data/models/product.dart';

import '../../../../core/di/dependancy_injection.dart';
import '../../../translate/presentation/bloc/translate/translate_cubit.dart';

abstract class HomeDetailsRemoteDataSource {
  Future<HomeDetailsProductModel> getProductDetails( int id);
}

class HomeDetailsRemoteDataSourceImpl implements HomeDetailsRemoteDataSource {
  final ApiServices _apiServices;

  HomeDetailsRemoteDataSourceImpl(this._apiServices);
  @override
  Future<HomeDetailsProductModel> getProductDetails( int id) async {
    String language = getIt<LocalCubit>().state.language;
    final response = await _apiServices.getProductDetails(
        language, AppSecured.authToken, id);
    return HomeDetailsProductModel.fromJson(response['data']);
  }
}
