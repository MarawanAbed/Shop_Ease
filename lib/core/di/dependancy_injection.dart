import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/ecommerce/auth/presentation/manager/translate/translate_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<SharedPreCacheHelper>(
      () => SharedPreCacheHelper(getIt<SharedPreferences>()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerFactory<LocaleCubit>(() => LocaleCubit());
}
