import 'package:chairy_app/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/spacers.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 8.h),
                child: Text(
                  AppStrings.selectPayment,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
              ),
              verticalSpacer(40.h),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    final cubit = MainCubit.get(context);
                    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => cubit.selectPayment("Card Payment"), // Select on tap
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Card Payment",
                                    groupValue: cubit.selectedPayment, // Connect to cubit's state
                                    onChanged: (value) => cubit.selectPayment(value!), // Handle selection
                                    fillColor: MaterialStateProperty.all(
                                      isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                  ),
                                  Text(
                                    AppStrings.cardPayment,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Montserrat',
                                      color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(ImageAssets.visa, width: 24, height: 24),
                                  horizontalSpacer(4.w),
                                  Image.asset(ImageAssets.masterCard, width: 24, height: 24),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(16.h),

                        GestureDetector(
                          onTap: () => cubit.selectPayment("Paypal"), // Select on tap
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Paypal",
                                    groupValue: cubit.selectedPayment,
                                    onChanged: (value) => cubit.selectPayment(value!),
                                    fillColor: MaterialStateProperty.all(
                                      isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                  ),
                                  Text(
                                    AppStrings.paypal,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Montserrat',
                                      color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(ImageAssets.paypal, width: 24, height: 24),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
