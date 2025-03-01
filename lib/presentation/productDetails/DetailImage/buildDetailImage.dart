import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDetailImage(String image, Alignment alignment) {
  return ClipRect(
    child: Align(
      alignment: alignment,
      widthFactor: 0.6, // Zoom effect
      heightFactor: 0.6,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
