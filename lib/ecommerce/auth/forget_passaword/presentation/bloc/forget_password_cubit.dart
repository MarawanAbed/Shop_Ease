import 'package:ecommerce/ecommerce/auth/forget_passaword/domain/use_cases/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPassword) : super(const ForgetPasswordState.initial());

  final ForgetPassword _forgetPassword;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void forgetPassword(String email) async {
    emit(const ForgetPasswordState.loading());
    try {
       await _forgetPassword(email);
      emit(const ForgetPasswordState.success());
    } catch (e) {
      emit(ForgetPasswordState.error(e.toString()));
    }
  }
}
