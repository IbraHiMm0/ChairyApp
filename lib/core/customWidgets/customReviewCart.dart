import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/color_manager.dart';
import '../spacers.dart';
import 'customActionButton.dart';
import '../../presentation/main/main_screen/main_cubit.dart';

class CustomReviewCart extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final int price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CustomReviewCart({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isDarkMode ? ColorManager.backgroundDark : ColorManager.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// **Image**
          Image.asset(
            img,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
          ),

          horizontalSpacer(12.w),

          /// **Title, Subtitle, and Buttons**
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// **Title & Price**
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat',
                          color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                        ),
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                      ),
                    ),
                  ],
                ),

                /// **Subtitle**
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                  ),
                ),

                verticalSpacer(8.h),

                /// **Action Buttons**
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// **Trash Button (Removes Item)**
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: ColorManager.primary, size: 24.sp),
                      onPressed: onRemove,
                    ),
                    horizontalSpacer(8.w),

                    /// **Decrement Button**
                    IconButton(
                      icon: Icon(Icons.remove, color: ColorManager.primary, size: 24.sp),
                      onPressed: () {
                        if (quantity > 1) {
                          onDecrease();
                        } else {
                          onRemove();
                        }
                      },
                    ),
                    horizontalSpacer(8.w),

                    /// **Quantity Display**
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat',
                        color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                      ),
                    ),
                    horizontalSpacer(8.w),

                    /// **Increment Button**
                    IconButton(
                      icon: Icon(Icons.add, color: ColorManager.primary, size: 24.sp),
                      onPressed: onIncrease,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}