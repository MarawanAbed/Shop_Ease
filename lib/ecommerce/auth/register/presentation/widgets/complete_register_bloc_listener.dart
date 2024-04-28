import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/bloc/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/services/navigator.dart';

class CompleteRegisterBlocListener extends StatelessWidget {
  const CompleteRegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            HelperMethod.showLoadingDialog(context);
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          success: () {
            Navigator.pop(context);
            HelperMethod.showSuccessToast('Success Register Now You Can Login', gravity: ToastGravity.BOTTOM);
            Navigators.pushNamedAndRemoveUntil(Routes.login);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
