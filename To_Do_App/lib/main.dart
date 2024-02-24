import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/controllers/cubit/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_app/style/app_themes.dart';
import 'package:to_do_app/views/screens/to_do/to_do_screen.dart';
// import 'package:to_do_app/views/screens/try.dart';
import 'controllers/cubit/theme_cubit/theme_cubit.dart';
import 'controllers/local_db/shared_preferences.dart';

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
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ToDoCubit()),
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            ThemeCubit.get(context).getTheme();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'To-Do',
              home: const ToDoScreen(),
              // home: const TryScreen(),
              theme: ThemeCubit.get(context).isDark
                  ? Themes.darkTheme
                  : Themes.lightTheme,
            );
          }),
        );
      },
    );
  }
}
