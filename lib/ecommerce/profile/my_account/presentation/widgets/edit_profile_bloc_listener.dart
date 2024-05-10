import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileBLocListener extends StatelessWidget {
  const EditProfileBLocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (context, state) {
        state.whenOrNull(
          imageInitial: () {
            HelperMethod.showLoadingDialog(context);
          },
          imageError: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message);
          },
          imageLoaded: () {
            Navigator.pop(context);
          },
          loading: () {
            HelperMethod.showLoadingDialog(context);
          },
          loaded: () {
            Navigator.pop(context);
            Navigators.pop();
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
