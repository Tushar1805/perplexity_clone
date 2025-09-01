import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/service_locator.dart';
import '../resources/app_keys.dart';
import '../resources/app_storage.dart';
import '../utils/core_utils.dart';
import 'app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(darkTheme);
  ThemeData? theme;
  final storage = sl<SecureStorage>();

  Future<void> getTheme() async {
    final val = await storage.readValue(themeString);
    customPrint('Entered to check theme: $val');
    if (val == 'dark') {
      theme = darkTheme;
    } else if (val == 'light') {
      theme = primaryTheme;
    } else {
      theme = primaryTheme;
    }
    emit(theme!);
    customPrint('Theme changed');
  }

  void toggleTheme() async {
    if (state == primaryTheme) {
      await storage.saveValue(key: themeString, value: 'dark');
      emit(darkTheme);
    } else {
      await storage.saveValue(key: themeString, value: 'light');
      emit(primaryTheme);
    }
  }
}
