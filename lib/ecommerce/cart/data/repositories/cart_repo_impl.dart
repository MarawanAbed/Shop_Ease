import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/core/networking/exception.dart';
import 'package:ecommerce/ecommerce/cart/data/data_sources/local_data_source.dart';
import 'package:ecommerce/ecommerce/cart/data/data_sources/remote_data_source.dart';
import 'package:ecommerce/ecommerce/cart/data/models/cart_model.dart';
import 'package:ecommerce/ecommerce/cart/data/models/ephemeral_keys.dart';
import 'package:ecommerce/ecommerce/cart/data/models/payment_intents.dart';
import 'package:ecommerce/ecommerce/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final Future<CartLocalDataSource> cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartLocalDataSource, this.cartRemoteDataSource);

  @override
  Future<void> addCart(CartModel cart) async {
    try {
      var dataSource = await cartLocalDataSource;
      await dataSource.addCart(cart);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeCart(int id) async {
    try {
      var dataSource = await cartLocalDataSource;
      await dataSource.removeCart(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> switchUserBox() async {
    try {
      var dataSource = await cartLocalDataSource;
      await dataSource.switchUserBox();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isAlreadyInCart(int id) async {
    try {
      var dataSource = await cartLocalDataSource;
      return await dataSource.isAlreadyInCart(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResult<EphemeralKeysModel>> createEphemeralKey(
      {required String customerId}) async {
    try {
      var response =
          await cartRemoteDataSource.createEphemeralKey(customerId: customerId);
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<ApiResult<PaymentIntents>> createPaymentIntent(
      {required String amount,
      required String customerId,
      required String currency}) async {
    try {
      var response = await cartRemoteDataSource.createPaymentIntent(
          amount: amount, customerId: customerId, currency: currency);
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDiorError(e));
      } else {
        return ApiResult.failure(ServerFailure(e.toString()));
      }
    }
  }


  @override
  String? getCurrentUserId() {
    return cartRemoteDataSource.getCurrentUserId();
  }
}
