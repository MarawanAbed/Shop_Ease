import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/ecommerce.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/bloc_observer.dart';
import 'core/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  bool? isOnBoarding = await getIt<SharedPreCacheHelper>()
          .getData(key: AppStrings.onboardingKey) ??
      false;
  bool? isLanguageSelected = await getIt<SharedPreCacheHelper>()
          .getData(key: AppStrings.isLanguageSelected) ??
      false;

  runApp(
    Ecommerce(
      isOnBoarding: isOnBoarding!,
      isLanguageSelected: isLanguageSelected!,
    ),
  );
}
