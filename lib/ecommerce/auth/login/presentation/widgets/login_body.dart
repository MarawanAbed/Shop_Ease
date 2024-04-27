import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/widgets/login_blo_listener.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../forget_passaword/presentation/widgets/forget_and_remember.dart';
import 'footer.dart';
import 'login_text_form_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
          const SizedBox(
            height: 30,
          ),
          const LoginTextField(),
          const SizedBox(
            height: 20,
          ),
          const ForgetPassword(),
          const SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
            title: lang.login,
            width: double.infinity,
            onPressed: () {
              context.read<LoginCubit>().signInWithEmailAndPassword();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const LoginBlocListener(),
          Footer(
            routes: Routes.register,
            subTitle: lang.register,
            title: lang.dontHaveAccount,
          ),
        ],
      ),
    );
  }
}
