part of 'update_user_data_cubit.dart';

@freezed
class UpdateUserDataState with _$UpdateUserDataState {
  const factory UpdateUserDataState.initial() = _Initial;

  const factory UpdateUserDataState.loading() = Loading;

  const factory UpdateUserDataState.loaded() = Loaded;

  const factory UpdateUserDataState.error(String message) = Error;
}
