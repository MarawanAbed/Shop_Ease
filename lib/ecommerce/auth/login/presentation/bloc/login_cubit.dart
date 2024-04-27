import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/twiiter_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/email_sign_in.dart';
import '../../domain/use_cases/github_sign_in.dart';
import '../../domain/use_cases/google_sign_in.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._twitterSignIn, this._googleSignIn, this._gitHubSignIn,
      this._emailSignIn)
      : super(const LoginState.initial());

  final TwitterSignIn _twitterSignIn;
  final GoogleSignInUseCase _googleSignIn;
  final GitHubSignInUseCase _gitHubSignIn;
  final EmailSignIn _emailSignIn;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signInWithTwitter() async {
    emit(const LoginState.loading());
    try {
      await _twitterSignIn.call();
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  void signInWithGoogle() async {
    emit(const LoginState.loading());
    try {
      await _googleSignIn.call();
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  void signInWithGitHub(BuildContext context) async {
    try {
      await _gitHubSignIn.call(context);
      emit(const LoginState.successWithGithub());
    } catch (e) {
      emit(LoginState.errorWithGithub(e.toString()));
    }
  }

  void signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      try {
        await _emailSignIn(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        emit(const LoginState.success());
      } catch (e) {
        emit(LoginState.error(e.toString()));
      }
    }
  }
}
