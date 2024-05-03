import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/ecommerce.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/services/bloc_observer.dart';
import 'core/utils/strings.dart';
import 'ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  final localCubit = getIt<LocalCubit>();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  var uId = getIt<AuthService>().getCurrentUserId();
  // Use a default key if the user ID is null
  uId = uId ?? 'default';
  await Hive.openBox<FavoriteModel>(uId);
  await localCubit.getSavedLanguage();
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
      localeCubit: localCubit,
    ),
  );
}
