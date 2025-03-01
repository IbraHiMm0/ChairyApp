import 'package:chairy_app/resources/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/customWidgets/buildBreadcrumb.dart';
import '../../../core/customWidgets/customProduct.dart';
import '../../../core/spacers.dart';
import '../../../data/product_model/product_model.dart'; // Import ProductModel & dummyProducts
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';
import '../../productDetails/productDetails_view/productDetails_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var cubit = MainCubit.get(context);

    return Scaffold(
      body: SingleChildScrollView(
        controller: cubit.categoryScrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 80.h, bottom: 10.h),
              child: Image(
                image: AssetImage(isDarkMode ? ImageAssets.cateImgB : ImageAssets.cateImgW),
                fit: BoxFit.cover,
              ),
            ),
            verticalSpacer(35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                children: [
                  buildBreadcrumb(AppStrings.categories),
                  buildBreadcrumb(AppStrings.livingRoom, isLast: true),
                ],
              ),
            ),
            verticalSpacer(12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.allLivingRoom,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Gilroy',
                      color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark,
                    ),
                  ),
                  verticalSpacer(5.h),
                  Text(
                    AppStrings.subTitleLivingRoom,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Gilroy',
                      color: isDarkMode ? ColorManager.white : ColorManager.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: isDarkMode ? ColorManager.black : ColorManager.white,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  ImageAssets.shape3,
                  width: 160.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13.0.h, horizontal: 20.w),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dummyProducts.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 10 / 16,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GestureDetector(
                      onTap: () {
                        cubit.navigateToProductDetails(dummyProducts[index], index);
                      },
                      child: CustomProduct(
                        title: dummyProducts[index].name,
                        subtitle: dummyProducts[index].description,
                        price: dummyProducts[index].price,
                        img: dummyProducts[index].image,
                        info: AppStrings.livingRoom,
                        onAddToCart: () {
                          if (cubit.cartItems.contains(dummyProducts[index])) {
                            // Show warning Snackbar if already in cart
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    dummyProducts[index].name + AppStrings.alreadyInCart,
                                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                ),
                                duration: const Duration(milliseconds: 500),
                                backgroundColor: ColorManager.primary, // Warning color
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          } else {
                            // Add to cart
                            cubit.addToCart(dummyProducts[index]);

                            // Show success Snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${dummyProducts[index].name} ${AppStrings.added}",
                                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                ),
                                duration: const Duration(milliseconds: 500),
                                backgroundColor: ColorManager.primary,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },

                      ),
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
