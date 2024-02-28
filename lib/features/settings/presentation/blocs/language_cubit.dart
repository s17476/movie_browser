import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  static const languageKey = 'LANGUAGE-KEY';

  void changeLanguage(String langCode) => emit(Locale(langCode));

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final locale = json[languageKey] ?? 'en';

    return Locale(locale);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) =>
      {languageKey: state.languageCode};
}
