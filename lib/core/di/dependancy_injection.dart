import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/networking/api_services.dart';
import 'package:ecommerce/core/networking/stripe/strip_services.dart';
import 'package:ecommerce/core/services/stripe.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/data/data_sources/forget_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/domain/repositories/forget_repo.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/domain/use_cases/forget_password.dart';
import 'package:ecommerce/ecommerce/auth/forget_passaword/presentation/bloc/forget_password_cubit.dart';
import 'package:ecommerce/ecommerce/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/login/data/repositories/login_repo_impl.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/email_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/google_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/twiiter_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:ecommerce/ecommerce/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/use_cases/create_user.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/use_cases/sign_up.dart';
import 'package:ecommerce/ecommerce/auth/register/presentation/bloc/register_cubit.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_banner.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/ecommerce/home/domain/use_cases/get_product_by_categories.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/banner_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/bloc/product_by_categories_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../ecommerce/auth/forget_passaword/data/repositories/forget_repo_impl.dart';
import '../../ecommerce/auth/login/domain/repositories/login_repo.dart';
import '../../ecommerce/auth/login/domain/use_cases/github_sign_in.dart';
import '../../ecommerce/auth/register/data/repositories/register_repo_impl.dart';
import '../../ecommerce/auth/register/domain/repositories/register_repo.dart';
import '../../ecommerce/auth/register/domain/use_cases/create_customer.dart';
import '../../ecommerce/home/data/data_sources/home_remote_data_source.dart';
import '../../ecommerce/home/data/repositories/home_repo_impl.dart';
import '../../ecommerce/home/domain/repositories/home_repo.dart';
import '../../ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import '../networking/dio_factory.dart';
import '../services/firebase_servies.dart';
import '../utils/app_secured.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<SharedPreCacheHelper>(
      () => SharedPreCacheHelper(getIt<SharedPreferences>()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  _setupDataSource();
  _setupRepositories();
  _setupUseCases();
  _setupCubit();
  _setupServices();
  _setupExternal();
}

void _setupDataSource() {
  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(authService: getIt()));

  getIt.registerLazySingleton<ForgetRemoteDataSource>(
      () => ForgetRemoteDataSourceImpl(authService: getIt()));

  getIt.registerLazySingleton<RegisterRemoteDataSource>(() =>
      RegisterRemoteDataSourceImpl(
          authService: getIt(), databaseService: getIt(), stripe: getIt()));

  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiServices: getIt()));
}

void _setupRepositories() {
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(loginRemoteDataSource: getIt()));

  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepoImpl(registerRemoteDataSource: getIt()));

  getIt.registerLazySingleton<ForgetRepo>(
      () => ForgetRepoImpl(dataSource: getIt()));

  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeRemoteDataSource: getIt()));
}

void _setupUseCases() {
  getIt.registerLazySingleton<TwitterSignIn>(
      () => TwitterSignIn(loginRepo: getIt()));
  getIt.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(loginRepo: getIt()));
  getIt.registerLazySingleton<GitHubSignInUseCase>(
      () => GitHubSignInUseCase(loginRepo: getIt()));
  getIt.registerLazySingleton<EmailSignIn>(
      () => EmailSignIn(loginRepo: getIt()));
  getIt.registerLazySingleton<ForgetPassword>(
      () => ForgetPassword(repo: getIt()));
  getIt.registerLazySingleton<SignUp>(() => SignUp(registerRepo: getIt()));
  getIt.registerLazySingleton<CreateUser>(
      () => CreateUser(registerRepo: getIt()));
  getIt.registerLazySingleton<GetBanner>(() => GetBanner(getIt()));
  getIt.registerLazySingleton<GetCategories>(() => GetCategories(getIt()));
  getIt.registerLazySingleton<GetProductByCategories>(
      () => GetProductByCategories(getIt()));
  getIt.registerLazySingleton<CreateCustomer>(
      () => CreateCustomer(registerRepo: getIt()));
}

void _setupCubit() {
  getIt.registerFactory<LocaleCubit>(() => LocaleCubit());
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(
        getIt(),
        getIt(),
        getIt(),
      ));

  getIt.registerFactory<BannerCubit>(() => BannerCubit(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt.registerFactory<ProductByCategoriesCubit>(
      () => ProductByCategoriesCubit(getIt()));
}

void _setupServices() async {
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(
      gitHubSignIn: getIt(),
      auth: getIt(),
      googleSignIn: getIt(),
      twitterLogin: getIt(),
    ),
  );
  getIt.registerLazySingleton<StorageService>(() => StorageService(
        getIt(),
      ));
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService(
        getIt(),
      ));
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<StripServices>(() => StripServices(
        dio,
      ));
  getIt.registerLazySingleton<Strip>(() => Strip(
        getIt(),
      ));

  getIt.registerLazySingleton<ApiServices>(() => ApiServices(
    dio,
  ));
}

void _setupExternal() {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: AppSecured.githubClientId,
    clientSecret: AppSecured.githubClientSecret,
    redirectUrl: AppSecured.githubRedirectUrl,
  );
  final twitterLogin = TwitterLogin(
      apiKey: AppSecured.twitterApiKey,
      apiSecretKey: AppSecured.twitterApiSecretKey,
      redirectURI: 'flutter-twitter-practice://');
  final storage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => storage);
  getIt.registerLazySingleton(() => googleSignIn);
  getIt.registerLazySingleton(() => gitHubSignIn);
  getIt.registerLazySingleton(() => twitterLogin);
}
