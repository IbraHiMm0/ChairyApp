
import 'package:chairy_app/core/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mainCubit = MainCubit.get(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.reviewOrder,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: isDarkMode
                            ? ColorManager.white
                            : ColorManager.darkGrey,
                      ),
                    ),
                    Text(
                      AppStrings.dearCustomer,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        color: isDarkMode
                            ? ColorManager.white
                            : ColorManager.darkGrey,
                      ),
                    ),
                    verticalSpacer(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildColumn(AppStrings.deliveryAddresss),
                        horizontalSpacer(20.w),
                        _buildColumnWithImage(AppStrings.payment),
                      ],
                    ),
                    verticalSpacer(20.h),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.r),
                          color: isDarkMode ? ColorManager.darkPrimary : ColorManager.greyContainer,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${AppStrings.urShoppingCart } ${mainCubit.cartItems.length}" ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                                color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                              ),
                            ),
                            verticalSpacer(10.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: mainCubit.cartItems.length,
                              itemBuilder: (context, index) {
                                final product = mainCubit.cartItems[index];
                                final quantity = mainCubit.getQuantity(product);
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(product.image, width: 100.w, height: 100.h),
                                        horizontalSpacer(14.h),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Montserrat',
                                                  color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                                ),
                                              ),
                                              Text(
                                                'Quantity: $quantity',
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Montserrat',
                                                  color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                                ),
                                              ),
                                              verticalSpacer(8.h),
                                              Text(
                                                '\$${product.price * quantity}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat',
                                                  color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(color: isDarkMode ? ColorManager.white : ColorManager.grey),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.total,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gilroy',
                              color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                            ),
                          ),
                          Text(
                            '\$${mainCubit.getTotalPrice().toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gilroy',
                              color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildColumn(String title) {
  return Builder(builder: (context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
              color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
            ),
          ),
          verticalSpacer(8.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? ColorManager.darkPrimary
                  : ColorManager.greyContainer,
              borderRadius: BorderRadius.circular(17.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${MainCubit.get(context).first} ${MainCubit.get(context).last}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
                Text(
                  "Street: ${MainCubit.get(context).street}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
                Text(
                  "Building Number: ${MainCubit.get(context).buildingNumber}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
                Text(
                  "City: ${MainCubit.get(context).city}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  });
}

Widget _buildColumnWithImage(String title) {
  return Expanded(
    child: Builder(builder: (context) {
      final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
              color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
            ),
          ),
          verticalSpacer(8.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? ColorManager.darkPrimary
                  : ColorManager.greyContainer,
              borderRadius: BorderRadius.circular(17.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MainCubit.get(context).selectedPayment,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color:
                        isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                  ),
                ),
                verticalSpacer(8.h),
                Row(
                  children: MainCubit.get(context).selectedPaymentImage.map((image) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(image, width: 40, height: 40),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      );
    }),
  );
}
