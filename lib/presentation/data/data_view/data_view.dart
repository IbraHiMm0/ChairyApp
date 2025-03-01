import 'package:chairy_app/core/customWidgets/customTextFormField.dart';
import 'package:chairy_app/core/spacers.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:chairy_app/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main/main_screen/main_cubit.dart';

class DataView extends StatelessWidget {
   const DataView({super.key});



  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 21.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 8.w,top: 8.h),
                child: Text(
                  AppStrings.deliveryAddress,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
              ),
              verticalSpacer(40.h),
              CustomTextFormField(
                hintText: AppStrings.city,
                numForm: 26,
                backgroundColor: Colors.transparent,
                hintColor: ColorManager.grey,
                textColor: ColorManager.darkGrey,
                width: 10.w,
                controller: MainCubit.get(context).cityController,
                valid: (value) {
                  return null;
                },
                keyboardType: TextInputType.text,

              ),
              CustomTextFormField(
                hintText: AppStrings.stName,
                numForm: 26,
                controller: MainCubit.get(context).streetController,
                backgroundColor: Colors.transparent,
                hintColor: ColorManager.grey,
                textColor: ColorManager.darkGrey,
                width: 10.w,
                valid: (value) {
                  return null;
                },
                keyboardType: TextInputType.text,

              ),
              CustomTextFormField(
                hintText: AppStrings.buildingNum,
                numForm: 26,
                controller: MainCubit.get(context).buildingController,
                backgroundColor: Colors.transparent,
                hintColor: ColorManager.grey,
                textColor: ColorManager.darkGrey,
                width: 10.w,
                valid: (value) {
                  return null;
                },
                keyboardType: TextInputType.number,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
