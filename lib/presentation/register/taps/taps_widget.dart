import 'package:chairy_app/resources/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customWidgets/customTextFormField.dart';
import '../../../core/spacers.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';
import '../register_view/register_cubit.dart';
import '../register_view/register_state.dart';

Widget buildAuthScreen(BuildContext context, AuthMode authMode) {
  return Builder(builder: (context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildAuthSwitcher(context, authMode),
          verticalSpacer(20.h),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
              decoration: BoxDecoration(
                color: isDarkMode
                    ? ColorManager.darkPrimary
                    : ColorManager
                        .lightGrey, // Background color based on dark mode
                borderRadius: BorderRadius.circular(
                    13.0.r), // Optional: To give rounded corners
              ),
              child: Column(
                children: [
                  // Check for signIn or signUp and display the appropriate widget
                  if (authMode == AuthMode.signIn)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        AppStrings.alreadyCustomer,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Gilroy-Bold',
                          color: isDarkMode
                              ? ColorManager.white
                              : ColorManager.darkGrey,
                        ),
                      ),
                    )
                  else
                    Column(
                      children: [
                        Text(
                          AppStrings.imNew,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Gilroy-Bold',
                            color: isDarkMode
                                ? ColorManager.white
                                : ColorManager.darkGrey,
                          ),
                        ),
                        Text(
                          AppStrings.enjoy,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy-Bold',
                            color: isDarkMode
                                ? ColorManager.white
                                : ColorManager.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  // Display the form (signIn or signUp form)
                  authMode == AuthMode.signIn
                      ? buildSignInForm()
                      : buildSignUpForm(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  });
}

Widget buildAuthSwitcher(BuildContext context, AuthMode authMode) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: buildAuthTab(
            context, AppStrings.signIn, authMode == AuthMode.signIn),
      ),
      Expanded(
        child: buildAuthTab(
            context, AppStrings.signUp, authMode == AuthMode.signUp),
      ),
    ],
  );
}

Widget buildAuthTab(BuildContext context, String text, bool isActive) {
  return Builder(builder: (context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => context.read<RegisterCubit>().toggleAuthMode(),
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isActive
              ? (isDarkMode
                  ? ColorManager.darkPrimary
                  : ColorManager.lightPrimary)
              : (isDarkMode ? ColorManager.darkGrey : ColorManager.lightGrey),
          border: BorderDirectional(
            bottom: BorderSide(
              color: isActive ? ColorManager.primary : Colors.transparent,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 3,
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isActive
                    ? ColorManager.primary
                    : (isDarkMode ? ColorManager.white : ColorManager.grey),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

Widget buildSignInForm() {
  return Builder(builder: (context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        CustomTextFormField(
          hintText: AppStrings.email,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          textColor: ColorManager.darkGrey,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.alternate_email,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
        verticalSpacer(10.h),
        CustomTextFormField(
          hintText: AppStrings.password,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          textColor: ColorManager.darkGrey,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.visiblePassword,
          suffix: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: isDarkMode
                    ? ColorManager.white
                    : ColorManager.backgroundDark,
              )),
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
      ],
    );
  });
}

Widget buildSignUpForm() {
  return Builder(builder: (context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var cubit = MainCubit.get(context);

    return Column(
      children: [
        CustomTextFormField(
          hintText: AppStrings.first,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          textColor: ColorManager.darkGrey,
          controller: MainCubit.get(context).firstNameController,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.person,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
        verticalSpacer(10.h),
        CustomTextFormField(
          hintText: AppStrings.last,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          controller: MainCubit.get(context).lastNameController,
          textColor: ColorManager.darkGrey,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.person,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
        verticalSpacer(10.h),
        CustomTextFormField(
          hintText: AppStrings.email,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          textColor: ColorManager.darkGrey,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.alternate_email,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
        verticalSpacer(10.h),
        CustomTextFormField(
          hintText: AppStrings.password,
          numForm: 26,
          backgroundColor: Colors.transparent,
          hintColor: ColorManager.grey,
          textColor: ColorManager.darkGrey,
          width: 0,
          valid: (value) {
            return null;
          },
          keyboardType: TextInputType.visiblePassword,
          suffix: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: isDarkMode
                    ? ColorManager.white
                    : ColorManager.backgroundDark,
              )),
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color:
                isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
            weight: 1,
          ),
        ),
        verticalSpacer(20.h),
        Row(
          children: [
            BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                final cubit = MainCubit.get(context);
                return Radio<bool>(
                  value: false, // Selected state
                  groupValue: cubit.isSelected, // Manage selection state
                  onChanged: (value) {
                    cubit.toggleSelected(); // Toggle selection state
                  },
                  fillColor: MaterialStateProperty.all(
                    cubit.isSelected ? ColorManager.black : ColorManager.primary,
                  ),
                );
              },
            ),

            horizontalSpacer(8.w),

            GestureDetector(
              onTap: () {
                final cubit = MainCubit.get(context);
                cubit.toggleSelected(); // Toggle when text is tapped
              },
              child: SizedBox(
                width: 240.w,
                child: Text(
                  AppStrings.termsAndConditions,
                  style: TextStyle(
                    color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),

        verticalSpacer(20.h),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50.0.w),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: isDarkMode
                          ? ColorManager.white
                          : ColorManager.backgroundDark,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Text(
                        AppStrings.or,
                        style: TextStyle(
                          color: isDarkMode
                              ? ColorManager.white
                              : ColorManager.backgroundDark,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: isDarkMode
                          ? ColorManager.white
                          : ColorManager.backgroundDark,
                    )),
                  ],
                ),
              ),
              verticalSpacer(20.h),
              Text(
                AppStrings.google,
                style: TextStyle(
                  color: isDarkMode
                      ? ColorManager.white
                      : ColorManager.backgroundDark,
                ),
              ),
              verticalSpacer(20.h),
              Image(
                image: const AssetImage(ImageAssets.google),
                  width: 40.w,
                height: 40.h,
              ),
            ],
          ),
        ),
      ],
    );
  });
}
