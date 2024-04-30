part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = _Initial;

  const factory BannerState.loading() = Loading;

  const factory BannerState.loaded(List<BannerModel> banners) = Loaded;


  const factory BannerState.error(String message) = Error;
}
