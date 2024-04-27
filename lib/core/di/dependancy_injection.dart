import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/ecommerce/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:ecommerce/ecommerce/auth/login/data/repositories/login_repo_impl.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/email_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/google_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/domain/use_cases/twiiter_sign_in.dart';
import 'package:ecommerce/ecommerce/auth/login/presentation/bloc/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../ecommerce/auth/login/domain/repositories/login_repo.dart';
import '../../ecommerce/auth/login/domain/use_cases/github_sign_in.dart';
import '../../ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
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
}

void _setupRepositories() {
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(loginRemoteDataSource: getIt()));
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
}

void _setupServices() {
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
