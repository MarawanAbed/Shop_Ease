import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/bloc/forget_password_cubit.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/pages/forget_password.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/pages/login_page.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/pages/complete_register.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/pages/register_page.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/add_cart_cubit.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/payment_cubit.dart';
import 'package:ecommerce/ecommerce/cart/presentation/bloc/remove_cart_cubit.dart';
import 'package:ecommerce/ecommerce/cart/presentation/pages/thank_you_page.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/add_favorite_cubit.dart';
import 'package:ecommerce/ecommerce/favorites/presentation/bloc/remove_favorites_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/banner_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/product_by_categories_cubit.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/bloc/product_details_cubit.dart';
import 'package:ecommerce/ecommerce/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:ecommerce/ecommerce/products_by_categories/presentation/pages/products_by_categories_page.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/get_single_user_cubit.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:ecommerce/ecommerce/profile/settings/presentation/pages/settings_page.dart';
import 'package:ecommerce/ecommerce/search/presentation/bloc/search_cubit.dart';
import 'package:ecommerce/ecommerce/search/presentation/pages/search_page.dart';
import 'package:ecommerce/ecommerce/translate/presentation/pages/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ecommerce/cart/presentation/pages/cart_page.dart';
import '../../ecommerce/home/presentation/pages/home_page.dart';
import '../../ecommerce/home_details/presentation/pages/home_details.dart';
import '../../ecommerce/products_by_categories/presentation/bloc/products_by_categories_cubit.dart';
import '../../ecommerce/profile/about_us/presentation/pages/about_us_page.dart';
import '../../ecommerce/profile/my_account/presentation/pages/edit_profile.dart';
import '../../ecommerce/profile/my_account/presentation/pages/my_account_page.dart';

class AppRoutes {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.onBoarding: (context) => const OnBoardingPage(),
    Routes.translate: (context) => const TranslatePage(),
    Routes.login: (context) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginPage(),
        ),
    Routes.register: (context) => const RegisterPage(),
    Routes.completeRegister: (context) => const CompleteRegisterPage(),
    Routes.forgotPassword: (context) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordPage(),
        ),
    Routes.home: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<BannerCubit>()..getBanner(),
            ),
            BlocProvider(create: (context) => getIt<CategoriesCubit>()),
            BlocProvider(
              create: (context) => getIt<ProductByCategoriesCubit>(),
            ),
            BlocProvider(create: (context) => getIt<AddFavoriteCubit>()),
            BlocProvider(create: (context) => getIt<RemoveFavoritesCubit>()),
          ],
          child: const HomePage(),
        ),
    Routes.homeDetails: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<ProductDetailsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<AddFavoriteCubit>(),
            ),
            BlocProvider(create: (context) => getIt<RemoveFavoritesCubit>()),
            BlocProvider(create: (context) => getIt<AddCartCubit>()),
            BlocProvider(create: (context) => getIt<RemoveCartCubit>()),
          ],
          child: const HomeDetailsPage(),
        ),
    Routes.productsByCategories: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AddFavoriteCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<ProductsByCategoriesCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<RemoveFavoritesCubit>(),
            ),
          ],
          child: const ProductsByCategoriesPage(),
        ),
    Routes.search: (context) => BlocProvider(
          create: (context) => getIt<SearchCubit>(),
          child: const SearchPage(),
        ),
    Routes.cart: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AddCartCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<PaymentCubit>(),
            ),
          ],
          child: const CartPage(),
        ),
    Routes.aboutUs: (context) => const AboutUsPage(),
    Routes.settings: (context) => const SettingsPage(),
    Routes.myAccount: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<GetSingleUserCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<UpdateUserDataCubit>(),
            ),
          ],
          child: const MyAccountPage(),
        ),
    Routes.editProfile: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<GetSingleUserCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<UpdateUserDataCubit>(),
            ),
          ],
          child: const EditProfilePage(),
        ),
    Routes.thankYou: (context) => const ThankYouView(),
  };
}
