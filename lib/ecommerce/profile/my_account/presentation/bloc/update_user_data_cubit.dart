import 'dart:io';

import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/use_cases/update_email_and_password.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/use_cases/update_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_data_cubit.freezed.dart';
part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this._updateUserData, this._updateEmailAndPassword)
      : super(const UpdateUserDataState.initial());

  final UpdateUserData _updateUserData;
  final UpdateEmailAndPassword _updateEmailAndPassword;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  void updateUser(Map<String, dynamic> data) async {
    emit(const UpdateUserDataState.loading());
    try {
      await _updateUserData.call(data);
      emit(const UpdateUserDataState.loaded());
    } catch (e) {
      emit(UpdateUserDataState.error(e.toString()));
    }
  }

  Future<void> updateEmailAndPassword(String email,String newPassword,oldPassword) async {
    emit(const UpdateUserDataState.loading());
    try {
      await _updateEmailAndPassword.call(email,newPassword,oldPassword);
      emit(const UpdateUserDataState.loaded());
    } catch (e) {
      emit(UpdateUserDataState.error(e.toString()));
    }
  }

  File? profileImage;
  String? imageUrl;

  uploadImageMethod() async {
    emit(const UpdateUserDataState.imageInitial());
    if (profileImage == null) {
      return;
    }
    try {
      imageUrl = await getIt<StorageService>().uploadImage(profileImage!);
    } catch (e) {
      emit(UpdateUserDataState.imageError(e.toString()));
    }
  }

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
