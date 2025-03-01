import 'package:chairy_app/presentation/menu/menu_view/menu_cubit.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/spacers.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart' as main_cubit;

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final bool isDarkMode = !state.isLightMode; // Ensure correct theme usage

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // **Header Section**
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h, bottom: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(isDarkMode ? ImageAssets.LOGOW : ImageAssets.LOGO),
                            width: 82.w,
                            height: 21.h,
                          ),
                          Builder(
                            builder: (context) {
                              return GestureDetector(
                                child: Image(
                                  image: const AssetImage(ImageAssets.cross),
                                  width: 32.w,
                                  height: 32.h,
                                ),
                                onTap: () {
                                  main_cubit.MainCubit.get(context).changeBottomNavBar(0);
                                },

                              );
                            }
                          ),
                        ],
                      ),
                      verticalSpacer(57.h),
                      Text(
                        AppStrings.menu,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Gilroy',
                          color: isDarkMode ? ColorManager.white : ColorManager.black,
                        ),
                      ),
                      verticalSpacer(36.h),

                      // **Language Selection**
                      Text(
                        AppStrings.language,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy',
                          color: isDarkMode ? ColorManager.white : ColorManager.black,
                        ),
                      ),
                      verticalSpacer(20.h),

                      Column(
                        children: [
                          _buildLanguageOption(
                            context,
                            isSelected: !state.isEnglish,
                            imageAsset: ImageAssets.egy,
                            label: AppStrings.ar,
                            onTap: () => context.read<MenuCubit>().toggleLanguage(),
                          ),
                          Divider(color: ColorManager.grey),
                          _buildLanguageOption(
                            context,
                            isSelected: state.isEnglish,
                            imageAsset: ImageAssets.eng,
                            label: AppStrings.en,
                            onTap: () => context.read<MenuCubit>().toggleLanguage(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Divider(thickness: 8, color: isDarkMode ? ColorManager.darkPrimary : ColorManager.dividerColor),

                // **Theme Selection**
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.theme,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy',
                          color: isDarkMode ? ColorManager.white : ColorManager.black,
                        ),
                      ),
                      verticalSpacer(20.h),
                      Column(
                        children: [
                          _buildThemeOption(
                            context,
                            isSelected: state.isLightMode,
                            imageAsset: ImageAssets.lightMode,
                            label: AppStrings.lightMode,
                            onTap: () {
                              if (!state.isLightMode) context.read<MenuCubit>().toggleTheme();
                            },
                          ),
                          Divider(color: ColorManager.grey),
                          _buildThemeOption(
                            context,
                            isSelected: !state.isLightMode,
                            imageAsset: ImageAssets.darkMode,
                            label: AppStrings.darkMode,
                            onTap: () {
                              if (state.isLightMode) context.read<MenuCubit>().toggleTheme();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // **Helper Method for Language Option**
  Widget _buildLanguageOption(
      BuildContext context, {
        required bool isSelected,
        required String imageAsset,
        required String label,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 61.w),
        child: Row(
          children: [
            if (isSelected) Icon(Icons.check, color: ColorManager.primary, size: 20.0.sp),
            horizontalSpacer(isSelected ? 8.0.w : 0.w),
            Image(image: AssetImage(imageAsset), width: 25.w, height: 25.h),
            horizontalSpacer(8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
                fontFamily: 'Montserrat',
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.white
                    : ColorManager.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Helper Method for Theme Option**
  Widget _buildThemeOption(
      BuildContext context, {
        required bool isSelected,
        required String imageAsset,
        required String label,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 61.w),
        child: Row(
          children: [
            if (isSelected) Icon(Icons.check, color: ColorManager.primary, size: 20.0.sp),
            horizontalSpacer(8.w),
            Image(image: AssetImage(imageAsset), width: 25.w, height: 25.h),
            horizontalSpacer(8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
                fontFamily: 'Montserrat',
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.white
                    : ColorManager.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
