import 'package:ecommerce/ecommerce/profile/my_account/domain/use_cases/update_email_and_password.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/use_cases/update_user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../presentation/bloc/update_user_data_cubit.freezed.dart';
part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this._updateUserData, this._updateEmailAndPassword)
      : super(const UpdateUserDataState.initial());

  final UpdateUserData _updateUserData;
  final UpdateEmailAndPassword _updateEmailAndPassword;

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  final addressController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  void updateUser(Map<String, dynamic> data) async {
    emit(const UpdateUserDataState.loading());
    try {
      await _updateEmailAndPassword(
          data['email'], data['password'], data['context']);
      await _updateUserData(data);
      emit(const UpdateUserDataState.loaded());
    } catch (e) {
      emit(UpdateUserDataState.error(e.toString()));
    }
  }
}
