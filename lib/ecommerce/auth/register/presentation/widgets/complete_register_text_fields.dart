import 'package:ecommerce/core/helpers/validation.dart';
import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';


class CompleteRegisterTextField extends StatefulWidget {
  const CompleteRegisterTextField({super.key});

  @override
  State<CompleteRegisterTextField> createState() => _CompleteRegisterTextFieldState();
}

class _CompleteRegisterTextFieldState extends State<CompleteRegisterTextField> {
  final _nameController = TextEditingController();
  final _enterYourPhoneController = TextEditingController();
  final _enterYourAddressController = TextEditingController();


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
