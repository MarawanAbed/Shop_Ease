part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;

  const factory CategoryState.loading() = Loading;

  const factory CategoryState.loaded(List<CategoryModel> categories) = Loaded;

  const factory CategoryState.error(String message) = Error;
}
