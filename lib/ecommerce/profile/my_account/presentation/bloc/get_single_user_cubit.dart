import 'package:ecommerce/ecommerce/profile/my_account/domain/use_cases/get_single_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/my_account.dart';

part 'get_single_user_cubit.freezed.dart';
part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  GetSingleUserCubit(this._getUser) : super(const GetSingleUserState.initial());
  final GetUser _getUser;

  void getSingleUser() {
    emit(const GetSingleUserState.loading());
    try {
      _getUser().listen((event) {
        emit(GetSingleUserState.loaded(event));
      });
    } catch (e) {
      emit(GetSingleUserState.error(e.toString()));
    }
  }
}
