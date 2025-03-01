import 'package:chairy_app/presentation/main/main_screen/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);

          return Scaffold(
            body: PageView(
              controller: cubit.pageController,
              physics: const NeverScrollableScrollPhysics(), // Disable swipe
              children: cubit.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: isDarkMode
                  ? ColorManager.bottomNavDark
                  : ColorManager.bottomNavLight,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: isDarkMode
                  ? ColorManager.white
                  : ColorManager.unselectedIconLight,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}

