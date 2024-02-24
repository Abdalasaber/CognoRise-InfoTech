import 'package:calculate_bmi/style/app_themes.dart';
import 'package:calculate_bmi/views/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/bmi_calculator_cubit/bmi_calculator_cubit.dart';
import 'controller/cubit/theme_cubit/theme_cubit.dart';
import 'controller/local/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => BmiCalculatorCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            ThemeCubit.get(context).getTheme();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Calculator App',
              home: const FirstScreen(),
              theme: ThemeCubit.get(context).isDark
                  ? Themes.darkTheme
                  : Themes.lightTheme,
            );
          },
        ));
  }
}