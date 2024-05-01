import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/helpers/helper_methods.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Error ||
          current is Success ||
          current is SuccessWithGithub ||
          current is ErrorWithGithub,
      listener: (context, state) {
        state.when(
          initial: () => null,
          loading: () async {
            HelperMethod.showLoadingDialog(context);
          },
          success: () {
            Navigator.pop(context);
            HelperMethod.showSuccessToast(
              'Login Successful',
              gravity: ToastGravity.BOTTOM,
            );
            Navigators.pushNamedAndRemoveUntil(Routes.home);
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          successWithGithub: () {
            HelperMethod.showSuccessToast(
              'Login Successful',
              gravity: ToastGravity.BOTTOM,
            );
            Navigators.pushNamedAndRemoveUntil(Routes.home);
          },
          errorWithGithub: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
