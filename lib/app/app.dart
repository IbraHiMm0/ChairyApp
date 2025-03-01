import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/menu/menu_view/menu_cubit.dart';
import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => MenuCubit(), // ✅ Provide globally
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              theme: buildLightTheme(Brightness.light),
              darkTheme: buildDarkTheme(Brightness.dark),
              themeMode: state.isLightMode ? ThemeMode.light : ThemeMode.dark, // ✅ Updates UI properly
              initialRoute: Routes.splashRoute,
            );
          },
        ),
      ),
    );
  }
}
