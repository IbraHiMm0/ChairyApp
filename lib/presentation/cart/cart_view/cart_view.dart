import 'package:chairy_app/core/customWidgets/customReviewCart.dart';
import 'package:chairy_app/core/spacers.dart';
import 'package:chairy_app/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/customWidgets/customButton.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../main/main_screen/main_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var cubit = MainCubit.get(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 20.0.w, left: 20.0.w, bottom: 60.h),
        child: Column(
          children: [
            /// **Cart Image Header**
            Image.asset(
              isDarkMode ? ImageAssets.yourCartW : ImageAssets.yourCartBL,
              width: 214.w,
              height: 190.h,
            ),

            /// **Dynamic List of Cart Items**
            Expanded(
              child: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  return cubit.cartItems.isEmpty
                      ? Center(
                        child: Text(
                          AppStrings.noProduct,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w800,
                            color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                          ),
                        ),
                      )
                      :ListView.builder(
                    itemCount: cubit.cartItems.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 100.h),

                    itemBuilder: (context, index) {
                      final item = cubit.cartItems[index];
                      final quantity = cubit.getQuantity(item);

                      return Dismissible(
                        key: UniqueKey(),// Ensure a unique key (use ID or name)
                        direction: DismissDirection.endToStart, // Swipe left to delete
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white, size: 32.sp),
                        ),
                        onDismissed: (direction) {
                          cubit.cartItems.removeAt(index); // Immediately remove from UI
                          cubit.removeFromCart(item); // Update state
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: CustomReviewCart(
                            onRemove: () => cubit.removeFromCart(item),
                            title: item.name,
                            subtitle: item.description,
                            price: item.price * quantity,
                            img: item.image,
                            quantity: quantity,
                            onIncrease: () => cubit.increaseQuantity(item),
                            onDecrease: () => cubit.decreaseQuantity(item),
                          ),
                        ),
                      );
                    },


                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// **Bottom Sheet for Total Price & Checkout**
      bottomSheet: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: isDarkMode ? ColorManager.backgroundDark : ColorManager.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// **Grey Divider**
                Container(
                  width: 50.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),

                verticalSpacer(12.h),

                /// **Total Price Display**
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
                        '\$ ${cubit.getTotalPrice().toStringAsFixed(2)}', // Updated total price
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

                verticalSpacer(16.h),

                /// **Place Order Button**
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: AppStrings.placeOrder,
                    onPressed: () {
                      cubit.navigateToCart();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
