part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = Loading;

  const factory RegisterState.success(UserModel user) = Success;

  const factory RegisterState.successCustomer(CustomerModel customer) =
      SuccessCustomer;

  const factory RegisterState.error(String message) = Error;
}
