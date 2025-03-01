import 'package:chairy_app/resources/assets_manager.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:chairy_app/resources/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/spacers.dart';
import '../../../resources/routes_manager.dart';
import '../../main/main_screen/main_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image:   AssetImage(isDarkMode? ImageAssets.LOGOW:ImageAssets.LOGO,),
                    width: 82.w,
                    height: 21.h,
                  ),
                  Builder(
                    builder: (context) {
                      var cubit = MainCubit.get(context);
                      return GestureDetector(
                        child: Image(
                          image: const AssetImage(ImageAssets.cross,),
                          width: 32.w,
                          height: 32.h,
                        ),
                        onTap: () {
                          cubit.changeBottomNavBar(0);  // Navigate to the CategoryView
                        },
                      );
                    }
                  )
                ],
              ),
              verticalSpacer(57.h),
              Text(AppStrings.title, style: TextStyle(fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Gilroy',color: isDarkMode?ColorManager.white:ColorManager.backgroundDark),),
              verticalSpacer(10.h),
              Text(AppStrings.subTitle, style: TextStyle(fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Gilroy',color: isDarkMode?ColorManager.white:ColorManager.backgroundDark),),
              verticalSpacer(51.h),
              Container(
                decoration: BoxDecoration(
                    color: isDarkMode?ColorManager.darkPrimary:ColorManager.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: ColorManager.primary)),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  keyboardType: TextInputType.text,
                  cursorColor: ColorManager.primary,
                  style:  TextStyle(
                    color: ColorManager.grey,
                    fontSize: 15.sp,
                  ),
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: AppStrings.search,
                    hintStyle:  TextStyle(
                      color: ColorManager.grey,
                      fontSize: 15.sp,
                      fontFamily: 'Montserrat'
                    ),
                    prefixText: '    ',
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                      },
                      child: Image(
                        image: AssetImage(isDarkMode?ImageAssets.searchW:ImageAssets.search,),
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(135.h),
              Image(
                image:  AssetImage(isDarkMode?ImageAssets.photoSearchW:ImageAssets.photoSearch,),
                width: 385.w,
                height: 286.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
