import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../spacers.dart';

class CustomCategory extends StatelessWidget {

final String? img;
final String? title;
final String? subtitle;
final String? info;

  const CustomCategory({super.key,  this.img, this.title, this.subtitle, this.info,}) ;


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 43.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23.r),
            child: Image(
              image:  AssetImage(
                '$img',
              ),
              width: 277.w,
              height: 277.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpacer(31.h),
          Text(
            '$title', style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Gilroy',color: isDarkMode?ColorManager.white:ColorManager.black
          ),),
          verticalSpacer(21.h),
          Text(
            '$subtitle', style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            fontFamily: 'Gilroy',color:ColorManager.grey,
          ),),
          verticalSpacer(14.h),
          Row(
            children: [
              Text(
                '$info', style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gilroy',color:ColorManager.primary,
              ),),
              horizontalSpacer(13.w),
              Icon(Icons.arrow_forward,color: ColorManager.primary,size: 24.sp,),
            ],
          ),
          verticalSpacer(17.h),

        ],
      ),
    );
  }
}
