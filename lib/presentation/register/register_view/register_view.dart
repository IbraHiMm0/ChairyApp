
import 'package:chairy_app/core/customWidgets/customButton.dart';
import 'package:chairy_app/core/spacers.dart';
import 'package:chairy_app/presentation/data/data_view/data_view.dart';
import 'package:chairy_app/presentation/payment/payment_view/payment_view.dart';
import 'package:chairy_app/presentation/register/register_view/register_state.dart';
import 'package:chairy_app/presentation/review/review_view/review_view.dart';
import 'package:chairy_app/presentation/thankYou/thanks_view/thanks_view.dart';
import 'package:chairy_app/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';
import '../stepperWidget/stepper_widget.dart';
import '../taps/taps_widget.dart';
import 'register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final registerCubit = context.read<RegisterCubit>();
          int stepIndex = state is RegisterStepState ? state.stepIndex : 0;
          AuthMode authMode = state is RegisterStepState ? state.authMode : AuthMode.signIn;

          return Scaffold(
            backgroundColor: isDarkMode ? ColorManager.backgroundDark : ColorManager.white,
            body: Column(
              children: [
                _buildBackArrow(context, registerCubit, stepIndex),
                buildStepper(stepIndex),
                Divider(
                  color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                  thickness: .5,
                ),
                verticalSpacer(24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    children: [
                      Text(
                        stepIndex == 4 ? AppStrings.thanksFor :(stepIndex == 0 ? AppStrings.welcomeTo : AppStrings.yourCustomer),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Gilroy-Heavy',
                          color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                        ),
                      ),
                      Text(
                        stepIndex == 4 ? AppStrings.dance : AppStrings.bringingYourStyle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy-Medium',
                          color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(10.h),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildAuthScreen(context, authMode),
                       DataView(),
                      const PaymentView(),
                      const ReviewView(),
                      const ThanksView(),
                    ],
                  ),
                ),
                verticalSpacer(20.h),
                _buildNextButton(context, registerCubit, stepIndex, authMode),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackArrow(BuildContext context, RegisterCubit cubit, int stepIndex) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w, top: 40.0.h),
        child: IconButton(
          icon: Icon(Icons.arrow_back, size: 28, color: ColorManager.primary),
          onPressed: () {
            if (stepIndex == 0) {
              var cubit = MainCubit.get(context);
              cubit.goBackToCart();

            } else {
              cubit.previousStep();
              _pageController.animateToPage(
                stepIndex - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, RegisterCubit cubit, int stepIndex, AuthMode authMode) {
    String buttonText = stepIndex == 0 ? (authMode == AuthMode.signIn ? AppStrings.signIn : AppStrings.signUp) :
    (stepIndex == 4 ? AppStrings.goHome :(stepIndex == 3 ? AppStrings.placeOrder : AppStrings.next));

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 30.h),
      child: CustomButton(
        width: 365.w,
        text: buttonText, onPressed: () {
        if (stepIndex < 4) {
          cubit.nextStep();
          _pageController.animateToPage(
            stepIndex + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          final reviewCubit = context.read<MainCubit>();
          reviewCubit.updateAddress(
            MainCubit.get(context).cityController.text,
            MainCubit.get(context).streetController.text,
            MainCubit.get(context).buildingController.text,
          );
          reviewCubit.updateName(
            MainCubit.get(context).firstNameController.text,
            MainCubit.get(context).lastNameController.text,
          );


        } else {
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
          // or try emit
        }
      },
      ),
    );
  }








}
