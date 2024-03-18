import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/ecommerce/auth/presentation/manager/translate/translate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/cache.dart';
import '../../../../../core/utils/strings.dart';

class LocaleCubit extends Cubit<LocalState> {
  LocaleCubit() : super(LocalState()) {
    getLanguageData();
  }


  String lang = 'en';

  Future setLanguageData(String value) async {
    lang = value;
    await getIt<SharedPreCacheHelper>()
        .saveData(key: AppStrings.languageCodeKey, value: value);
    emit(LocalState(language: lang));
  }

  Future getLanguageData() async {
    final String language = await getIt<SharedPreCacheHelper>()
            .getData(key: AppStrings.languageCodeKey) ??
        'en';
    lang = language;
    emit(LocalState(language: language));
  }
}
