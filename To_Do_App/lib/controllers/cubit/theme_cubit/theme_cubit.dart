import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../local_db/enums.dart';
import '../../local_db/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark; //  (!isDrake mean is true)
    MyCache.putBoolean(key: MyCacheKeys.isDark, value: isDark);
    emit(ChangeTheme());
  }

  void getTheme() {
    MyCache.getBoolean(key: MyCacheKeys.isDark);
  }
}
