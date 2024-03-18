import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/core/utils/strings.dart';
import 'package:ecommerce/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/translate/translate_cubit.dart';

class TranslateBody extends StatelessWidget {
  const TranslateBody({super.key});


  Future<void> _saveOnboardingPreference() async {
    await getIt<SharedPreCacheHelper>().saveData(
      key: AppStrings.isLanguageSelected,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Choose your language',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          CustomElevatedButton(
            width: double.infinity,
            title: 'English',
            onPressed: () async {
              context.read<LocaleCubit>().setLanguageData('en');
              await _saveOnboardingPreference();
              Navigators.pushNamedAndRemoveUntil(Routes.login);
            },
            colors: Colors.orange,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomElevatedButton(
            width: double.infinity,
            title: 'عربي',
            onPressed: () async {
              context.read<LocaleCubit>().setLanguageData('ar');
              await _saveOnboardingPreference();
              Navigators.pushNamedAndRemoveUntil(Routes.login);
            },
            colors: Colors.orange,
          ),
        ],
      ),
    );
  }
}
