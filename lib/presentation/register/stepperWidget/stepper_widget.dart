import 'package:chairy_app/resources/color_manager.dart';
import 'package:chairy_app/resources/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<String> stepNames = [AppStrings.register, AppStrings.data, AppStrings.payment, AppStrings.review];

Widget buildStepper(int stepIndex) {

  return Builder(
    builder: (context) {
      final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: List.generate(4, (index) {
            return Expanded(
              child: Row(
                children: [
                  stepperItem(index, stepIndex),
                  if (index < 3) // Add dividers between steps
                    Expanded(
                      child: Container(
                          height: 2.h,
                          color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark// Grey divider between steps
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      );
    }
  );
}

Widget stepperItem(int index, int stepIndex) {


  return Builder(
    builder: (context) {
      final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      bool isCompleted = index < stepIndex;
      bool isCurrent = index == stepIndex;
      Color borderColor = isCompleted ? Colors.green : (isCurrent ? Colors.lightGreen : Colors.grey);
      Color textColor = isCompleted
          ? ColorManager.green //
          : (isDarkMode ? ColorManager.white : ColorManager.backgroundDark);

      isCompleted ? ColorManager.green  : (isCurrent && isDarkMode)? ColorManager.white : ColorManager.backgroundDark;
      Color backgroundColor = isCompleted || isCurrent ? Colors.lightGreen.withOpacity(0.3) : Colors.transparent;

      return Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle part
            Container(
              height: 30.w, // You can adjust this based on your design
              width: 30.w, // Adjust width to make it flexible
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                color: isCompleted ? Colors.green : Colors.transparent,
              ),
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                  : null,
            ),
            SizedBox(height: 8.h), // Space between circle and text
            // Text part
            Text(
              stepNames[index],
              style: TextStyle(
                color: textColor,
                fontSize: 12.sp,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }
  );
}