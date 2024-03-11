import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'localization_cubit.freezed.dart';
part 'localization_cubit.g.dart';
part 'localization_state.dart';

@singleton
class LocalizationCubit extends HydratedCubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState.initial());

  void changeLanguage(String languageCode) => emit(
        state.copyWith(languageCode: languageCode),
      );

  void changeCountry(String countryCode) => emit(
        state.copyWith(languageCode: countryCode),
      );

  void initialize(Locale locale) {
    if (!state.isInitialized) {
      emit(
        LocalizationState(
          isInitialized: true,
          languageCode: locale.languageCode,
          countryCode: locale.countryCode ?? 'US',
        ),
      );
    }
  }

  @override
  LocalizationState? fromJson(Map<String, dynamic> json) =>
      LocalizationState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(LocalizationState state) => state.toJson();
}
