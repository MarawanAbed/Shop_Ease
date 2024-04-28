import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/bloc/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: (){
            HelperMethod.showLoadingDialog(context);
          },
          success: (){
            Navigator.pop(context);
            HelperMethod.showSuccessToast("a message sent to your email",gravity: ToastGravity.BOTTOM);
          },
          error: (message){
            Navigator.pop(context);
            HelperMethod.showErrorToast(message,gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
