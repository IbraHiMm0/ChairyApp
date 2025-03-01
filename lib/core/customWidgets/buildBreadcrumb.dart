import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

Widget buildBreadcrumb(String text, {bool isLast = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Gilroy',
          color: ColorManager.primary,
        ),
      ),
      if (!isLast)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Icon(Icons.arrow_forward_ios, size: 14.sp, color: ColorManager.primary),
        ),
    ],
  );
}