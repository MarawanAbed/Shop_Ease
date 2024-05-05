import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/cache.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalState());

  Future<void> getSavedLanguage() async {
    final language =
        await getIt<SharedPreCacheHelper>().getCachedLanguageCode();
    emit(LocalState(language: language));
  }

  Future<void> changeLanguage(String languageCode) async {
    await getIt<SharedPreCacheHelper>().cacheLanguageCode(languageCode);
    emit(LocalState(language: languageCode));
  }


}
