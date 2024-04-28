import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:ecommerce/core/widgets/logo.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/widgets/register_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_text_navigator.dart';
import '../../../../../generated/l10n.dart';
import '../bloc/register_cubit.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late RegisterCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cubit = getIt<RegisterCubit>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return BlocProvider.value(
      value: _cubit,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              SizedBox(
                height: 30.h,
              ),
              const RegisterTextField(),
              SizedBox(
                height: 30.h,
              ),
              CustomElevatedButton(
                title: lang.register,
                width: double.infinity,
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    print(_cubit.emailController.text);
                    print(_cubit.passwordController.text);
                    Navigators.pushNamed(Routes.completeRegister,arguments: _cubit);
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomMultiTextNavigator(
                title: lang.alreadyHaveAccount,
                subTitle: lang.login,
                routes: Routes.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
