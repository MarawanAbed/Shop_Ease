import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../../../../../core/widgets/logo.dart';
import '../../../../../generated/l10n.dart';
import '../bloc/register_cubit.dart';
import 'complete_register_bloc_listener.dart';
import 'complete_register_text_fields.dart';

class CompleteRegisterBody extends StatefulWidget {
  const CompleteRegisterBody({super.key});

  @override
  State<CompleteRegisterBody> createState() => _CompleteRegisterBodyState();
}

class _CompleteRegisterBodyState extends State<CompleteRegisterBody> {
  late RegisterCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit = ModalRoute.of(context)?. settings.arguments as RegisterCubit;
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
            children: [
              const Logo(),
              SizedBox(
                height: 30.h,
              ),
              const CompleteRegisterTextField(),
              SizedBox(
                height: 30.h,
              ),
              const CompleteRegisterBlocListener(),
              CustomElevatedButton(
                title: lang.register,
                width: double.infinity,
                onPressed: () {
                 if(_formKey.currentState!.validate()){
                     _cubit.signUpWithEmailAndPassword();
                 }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
