import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:ecommerce/ecommerce/cart/domain/use_cases/switch_box.dart';
import 'package:ecommerce/ecommerce/favorites/domain/use_cases/favorite_switch_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/di/dependancy_injection.dart';
import '../../../../../core/helpers/helper_methods.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.dataSource});

  final String dataSource;

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
          success: () async {
            Navigator.pop(context);
            HelperMethod.showSuccessToast(
              'Login Successful',
              gravity: ToastGravity.BOTTOM,
            );
            await getIt<FavoriteSwitchBoxUseCase>().call();
            await getIt<SwitchBoxUseCase>().call();
            var uId = getIt<AuthService>().getCurrentUserId();
            if (dataSource == 'local') {
              await getIt<SharedPreCacheHelper>()
                  .saveData(key: 'dataSource_$uId', value: dataSource);
              Navigators.pushNamedAndRemoveUntil(Routes.home,);
            } else {
              Navigators.pushNamedAndRemoveUntil(Routes.home,);
            }
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          successWithGithub: () async {
            HelperMethod.showSuccessToast(
              'Login Successful',
              gravity: ToastGravity.BOTTOM,
            );
            await getIt<FavoriteSwitchBoxUseCase>().call();
            await getIt<SwitchBoxUseCase>().call();
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
