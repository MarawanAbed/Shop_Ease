import 'package:ecommerce/ecommerce/home/data/models/banner.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_banner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/exception.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._getBanner) : super(const BannerState.initial());

  final GetBanner _getBanner;


  void getBanner() async {
    emit(const BannerState.loading());
    final result = await _getBanner();
    result.when(
      success: (List<BannerModel> data) {
        emit(BannerState.loaded(data));
      },
      failure: (Failures error) {
        emit(BannerState.error(error.message));
      },
    );
  }
}
