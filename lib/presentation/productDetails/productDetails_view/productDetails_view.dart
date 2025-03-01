import 'package:carousel_slider/carousel_slider.dart';
import 'package:chairy_app/core/spacers.dart';
import 'package:chairy_app/presentation/main/main_screen/main_cubit.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customWidgets/buildBreadcrumb.dart';
import '../../../core/customWidgets/customActionButton.dart';
import '../../../core/customWidgets/customButton.dart';
import '../../../data/product_model/product_model.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/string_manager.dart';
import '../DetailImage/buildDetailImage.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel? product;

  const ProductDetails({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var cubit = MainCubit.get(context);
    var selectedProduct = product ?? cubit.selectedProduct;

    if (selectedProduct == null) {
      return const Scaffold(
        body: Center(child: Text("No product selected")),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 40.h,
            left: 20.w,
            right: 20.w,
            bottom: 160.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: cubit.goBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorManager.primary,
                  size: 24.sp,
                ),
              ),

              verticalSpacer(20.h),

              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  buildBreadcrumb(AppStrings.categories),
                  buildBreadcrumb(AppStrings.livingRoom),
                  buildBreadcrumb(selectedProduct.name, isLast: true),
                ],
              ),

              verticalSpacer(20.h),

              Container(
                height: 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(selectedProduct.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              verticalSpacer(20.h),

              Row(
                children: [
                  Expanded(
                    child: buildDetailImage(selectedProduct.image, Alignment.bottomCenter),
                  ),
                  horizontalSpacer(10.w),
                  Expanded(
                    child: buildDetailImage(selectedProduct.image, Alignment.center),
                  ),
                ],
              ),

              verticalSpacer(30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedProduct.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Gilroy',
                      color: isDarkMode
                          ? ColorManager.white
                          : ColorManager.backgroundDark,
                    ),
                  ),

                  /// **Product Total Price** (Price * Quantity)
                  BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      int quantity = cubit.getQuantity(selectedProduct);
                      return Text(
                        "\$${selectedProduct.price * (quantity > 0 ? quantity : 1)}",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          color: isDarkMode
                              ? ColorManager.white
                              : ColorManager.backgroundDark,
                        ),
                      );
                    },
                  ),
                ],
              ),

              verticalSpacer(16.h),

              Text(
                selectedProduct.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gilroy',
                  color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                ),
              ),

              verticalSpacer(24.h),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: isDarkMode ? ColorManager.backgroundDark : ColorManager.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// **Decrease Button**
                    IconButton(
                      icon: Icon(Icons.remove, size: 30.sp, color: ColorManager.primary),
                      onPressed: () => cubit.decreaseQuantity(selectedProduct),
                    ),

                    horizontalSpacer(12.w),

                    /// **Quantity Display**
                    BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) {
                        return Text(
                          '${cubit.getQuantity(selectedProduct)}',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Gilroy',
                            color: isDarkMode
                                ? ColorManager.white
                                : ColorManager.backgroundDark,
                          ),
                        );
                      },
                    ),

                    horizontalSpacer(12.w),

                    /// **Increase Button**
                    IconButton(
                      icon: Icon(Icons.add, size: 30.sp, color: ColorManager.primary),
                      onPressed: () => cubit.increaseQuantity(selectedProduct),
                    ),
                  ],
                ),

                Image(
                  image: const AssetImage(ImageAssets.share),
                  width: 45.w,
                  height: 45.h,
                ),
              ],
            ),

            verticalSpacer(16.h),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: AppStrings.addToCart,
                onPressed: () {
                  cubit.addToCart(selectedProduct);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${selectedProduct.name} ${AppStrings.added}",
                        style: TextStyle(fontSize: 16.sp, color: ColorManager.white),
                      ),
                      duration: const Duration(milliseconds: 500),
                      backgroundColor: ColorManager.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}