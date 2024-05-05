import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/utils/app_secured.dart';
import 'package:ecommerce/ecommerce.dart';
import 'package:ecommerce/ecommerce/favorites/data/models/favorites_entity.dart';
import 'package:ecommerce/ecommerce/profile/settings/presentation/bloc/dark_theme_cubit.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/services/bloc_observer.dart';
import 'core/utils/strings.dart';
import 'ecommerce/cart/data/models/cart_model.dart';
import 'ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  Stripe.publishableKey = AppSecured.stripePublishableKey;
  final localCubit = getIt<LocalCubit>();
  final darkThemeCubit = getIt<DarkThemeCubit>();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  var uId = getIt<AuthService>().getCurrentUserId();
  uId = uId ?? 'default';
  await Hive.openBox<FavoriteModel>('favorite_$uId');
  await Hive.openBox<CartModel>('cart_$uId');
  await localCubit.getSavedLanguage();
  await darkThemeCubit.getSavedTheme();
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
      darkThemeCubit: darkThemeCubit,
    ),
  );
}
