import 'package:ecommerce/core/helpers/validation.dart';
import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/bloc/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';


class CompleteRegisterTextField extends StatefulWidget {
  const CompleteRegisterTextField({super.key});

  @override
  State<CompleteRegisterTextField> createState() => _CompleteRegisterTextFieldState();
}

class _CompleteRegisterTextFieldState extends State<CompleteRegisterTextField> {


  late TextEditingController _nameController;
  late TextEditingController _enterYourPhoneController;
  late TextEditingController _enterYourAddressController;

  @override
  void initState() {
    var cubit = context.read<RegisterCubit>();
    _nameController = cubit.nameController;
    _enterYourPhoneController = cubit.enterYourPhoneController;
    _enterYourAddressController = cubit.enterYourAddressController;
    super.initState();
  }


  @override
  void dispose() {
    _nameController.dispose();
    _enterYourPhoneController.dispose();
    _enterYourAddressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      children: [
        AppTextFormField(
          hintText: lang.enterYourName,
          controller: _nameController,
          backgroundColor: Colors.white,
          validator: (name) => Validation.validateRequired(name!),
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        AppTextFormField(
          hintText: lang.enterYourPhone,
          controller: _enterYourPhoneController,
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          validator: (phone) => Validation.validatePhone(phone!),
        ),
        SizedBox(
          height: 20.h,
        ),
        AppTextFormField(
          hintText: lang.enterYourAddress,
          controller: _enterYourAddressController,
          validator: (address) => Validation.validateRequired(address!),
          inputTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
