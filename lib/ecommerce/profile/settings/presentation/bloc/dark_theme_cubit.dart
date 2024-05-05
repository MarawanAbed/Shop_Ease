import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dark_theme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  DarkThemeCubit() : super(DarkThemeState());


  Future<void> getSavedTheme() async {
    final theme = await getIt<SharedPreCacheHelper>().getData(key: AppStrings.isDark)??false;
    emit(DarkThemeState(isDark: theme));
  }

  Future<void> changeTheme(bool theme) async {
    await getIt<SharedPreCacheHelper>().saveData(key: AppStrings.isDark, value: theme);
    emit(DarkThemeState(isDark: theme));
  }
}
