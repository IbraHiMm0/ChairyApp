import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../spacers.dart';

class CustomProduct extends StatelessWidget {

  final String? img;
  final String? title;
  final String? subtitle;
  final String? info;
  final int? price;
  final VoidCallback? onAddToCart;
  const CustomProduct({super.key,  this.img, this.title, this.subtitle, this.info, this.price, this.onAddToCart,}) ;


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return  SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img!,fit: BoxFit.cover,height: 100,width: 200,),
          verticalSpacer(12.h),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Gilroy',
              color:ColorManager.productTitleColor ,
            ),
          ),
          Text(
            '$subtitle',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gilroy',
              color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark ,
            ),
          ),
          verticalSpacer(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + '$price',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark ,
                ),
              ),
              Container(
                width: 32.w, // Adjust size as needed
                height: 32.h,
                decoration:  BoxDecoration(
                  color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                  shape: BoxShape.circle, // Makes it rounded
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 16.sp, // Adjust size to fit within the circle
                    color: isDarkMode ? ColorManager.backgroundDark : ColorManager.white,
                  ),
                  onPressed:onAddToCart,
                  padding: EdgeInsets.zero, // Ensures proper centering
                  constraints: const BoxConstraints(), // Removes extra padding
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
