import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

/// **Reusable Action Button (For Increment)**
Widget buildActionButton(IconData icon) {
  return Container(
    width: 32.w,
    height: 32.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: (ColorManager.primary),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      icon: Icon(icon, size: 18.sp, color: ColorManager.white),
      onPressed: () {},
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    ),
  );
}