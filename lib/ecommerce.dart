import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'ecommerce/translate/presentation/bloc/translate/translate_state.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({
    super.key,
    required this.isOnBoarding,
    required this.isLanguageSelected,
    required this.localeCubit,
  });

  final bool isOnBoarding;
  final bool isLanguageSelected;
  final LocalCubit localeCubit;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider.value(
        value: localeCubit,
        child: BlocBuilder<LocalCubit, LocalState>(
          buildWhen: (previous, current) => previous.language != current.language,
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(state.language),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              debugShowCheckedModeBanner: false,
              navigatorKey: Navigators.navigationKey,
              themeMode: ThemeMode.light,
              title: 'Ecommerce',
              routes: AppRoutes.routes,
              initialRoute: isOnBoarding && isLanguageSelected
                  ? FirebaseAuth.instance.currentUser == null
                      ? Routes.login
                      : Routes.home
                  : (isOnBoarding ? Routes.translate : Routes.onBoarding),
            );
          },
        ),
      ),
    );
  }
}
