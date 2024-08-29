import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/shared_preference/shared_preference_manager.dart';
import 'package:meta/meta.dart';

part 'app_settings_event.dart';

part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  bool isDark = false;
  String languageCode = 'en';
  final SharedPreferenceManager sharedPreferenceManager;

  AppSettingsBloc(this.sharedPreferenceManager)
      : super(AppSettingsInitialState()) {
    on<AppSettingsEvent>((event, emit) {});
    on<LanguageChangeEvent>(_onLanguageChangeEvent);
    on<ModeChangeEvent>(_onModeChangeEvent);
    on<GetInitialSettingsEvent>(_onGetInitialSettingsEvent);
    on<GetInitialModeEvent>(getMode);
  }

  FutureOr<void> _onGetInitialSettingsEvent(
      GetInitialSettingsEvent event, Emitter<AppSettingsState> emit) async {
    try {
      getLocale();
      emit(GetInitialSettingsState(languageCode, isDark));
    } catch (e) {
      emit(NetworkErrorState(e.toString()));
    }
  }

  Future<Locale> getLocale() async {
    print(" ------------------ getLocale ------------------ ");
    languageCode = await sharedPreferenceManager.getLang();
    print(languageCode);
    return Locale(languageCode);
  }

  FutureOr<void> _onModeChangeEvent(
      ModeChangeEvent event, Emitter<AppSettingsState> emit) async {
    emit(ModeChangeLoadingState());
    try {
      isDark = !isDark;
      await sharedPreferenceManager.setMode(isDark);
      emit(ModeChangeSuccessState());
    } catch (e) {
      emit(ModeChangeFailState(e.toString()));
    }
  }

  FutureOr<void> _onLanguageChangeEvent(
      LanguageChangeEvent event, Emitter<AppSettingsState> emit) async {
    emit(LanguageChangeLoadingState());
    try {
      isDark = !isDark;
      sharedPreferenceManager.setLang(event.localeCode);
      emit(LanguageChangeSuccessState());
    } catch (e) {
      emit(LanguageChangeFailState(e.toString()));
    }
  }

  FutureOr<void> getMode(
      GetInitialModeEvent event, Emitter<AppSettingsState> emit) async {
    try {
      isDark = await sharedPreferenceManager.getMode();
      emit(GetInitialModeState(isDark));
    } catch (e) {
      emit(NetworkErrorState(e.toString()));
    }
  }
}
