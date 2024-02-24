import 'package:calcuator/style/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/cubit/theme_cubit/theme_cubit.dart';
import 'controller/local/shared_preferences.dart';
import 'views/screens/calculator/calculator_screen.dart';

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
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            ThemeCubit.get(context).getTheme();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Calculator App',
              home: const CalculatorScreen(),
              theme: ThemeCubit.get(context).isDark
                  ? Themes.darkTheme
                  : Themes.lightTheme,
            );
          },
        ));
  }
}
