part of 'get_single_user_cubit.dart';

@freezed
class GetSingleUserState with _$GetSingleUserState {
  const factory GetSingleUserState.initial() = _Initial;

  const factory GetSingleUserState.loading() = Loading;

  const factory GetSingleUserState.loaded(MyAccountModel user) = Loaded;
  const factory GetSingleUserState.error(String message) = Error;
}
