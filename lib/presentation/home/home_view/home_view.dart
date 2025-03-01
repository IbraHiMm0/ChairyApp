import 'package:carousel_slider/carousel_slider.dart';
import 'package:chairy_app/core/customWidgets/customCategory.dart';
import 'package:chairy_app/presentation/category/category_view/category_view.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/spacers.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/string_manager.dart';
import '../../main/main_screen/main_cubit.dart';
import '../../menu/menu_view/menu_cubit.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 800.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.backImg),
                      // Replace with your background image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  left: 20.w,
                  right: 20.w,
                  top: 44.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage(
                                ImageAssets.LOGOW
                            ),
                            width: 82.w,
                            height: 21.h,
                          ),
                          Builder(
                            builder: (context) {
                              var cubit = MainCubit.get(context);

                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cubit.navigateToSearchView();
                                    },
                                    child: Image(
                                      image: const AssetImage(ImageAssets.searchO),
                                      width: 82.w,
                                      height: 21.h,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.menu,
                                      color: ColorManager.primary,
                                      size: 32.h,
                                    ),
                                    onTap: () {
                                      cubit.navigateToMenuView();
                                    },
                                  ),
                                ],
                              );
                            }
                          ),

                        ],
                      ),
                      verticalSpacer(132.h),
                      Column(
                        children: [
                          Text(AppStrings.homeTitle,textAlign: TextAlign.center, style: TextStyle(fontSize: 36.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gilroy',color:ColorManager.white),),
                          verticalSpacer(12.h),
                          Text(AppStrings.homeSubTitle,textAlign:TextAlign.center, style: TextStyle(fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gilroy',color: ColorManager.white),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: isDarkMode ? ColorManager.black : ColorManager.white,
              child: Stack(
                children: [
                  Positioned(
                    right: 0, // Align shape to the right edge
                    top: 0,
                    bottom: 0,
                    width: 150.w, // Adjust width of the shape
                    child: Image.asset(
                      ImageAssets.shape,

                      fit: BoxFit.cover, // Keeps the shape from stretching
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                    child: Text(
                      AppStrings.categoryTitle,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 42.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Gilroy',
                        color: isDarkMode ? ColorManager.white : ColorManager.backgroundDark, // Matches the text in the image
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    onTap: () {
                      MainCubit.get(context).changeBottomNavBar(1);  // Navigate to the CategoryView
                    },
                    child: const CustomCategory(
                      title: AppStrings.livingRoom,
                      subtitle: AppStrings.subTitleLivingRoom,
                      img: ImageAssets.living,
                      info: AppStrings.moreInfo,
                    ),
                  ),
                  const CustomCategory(
                    title: AppStrings.bedroom,
                    subtitle: AppStrings.subTitleBed,
                    img: ImageAssets.bed,
                    info: AppStrings.moreInfo,
                  ),
                  const CustomCategory(
                    title: AppStrings.kitchen,
                    subtitle: AppStrings.subTitleKitchen,
                    img: ImageAssets.kitchen,
                    info: AppStrings.moreInfo,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: isDarkMode ? ColorManager.black : ColorManager.white,
              child: Align(
                alignment: Alignment.centerLeft, // Align image to the left edge
                child: Image.asset(
                  ImageAssets.shape2,
                  width: 220.w, // Adjust width to make it larger
                  fit: BoxFit.cover, // Ensures proper scaling
                ),
              ),
            ),
            Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
               child: CustomCategory(
                title: AppStrings.furnish,
                subtitle: AppStrings.discover,
                img: isDarkMode ? ImageAssets.chooseWiselyB : ImageAssets.chooseWiselyW,
                 info: AppStrings.moreInfo,
                           ),
             ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
              color: isDarkMode ? ColorManager.black : ColorManager.white,
              ),
              child: Align(
                alignment: Alignment.centerRight, // Align image to the left edge
                child: Image.asset(
                  ImageAssets.shape3,
                  width: 220.w, // Adjust width to make it larger
                  fit: BoxFit.cover, // Ensures proper scaling
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: isDarkMode?ColorManager.darkPrimary:ColorManager.carouselBackground,
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
                child: Column(
                  children: [
                    Text(
                      AppStrings.someOfOur,textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gilroy',color:ColorManager.primary,
                    ),),
                    verticalSpacer(23.h),
                    Text(
                      AppStrings.features,textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Gilroy',color: isDarkMode?ColorManager.white:ColorManager.backgroundDark
                    ),),
                    verticalSpacer(23.h),
                    CarouselSlider(
                      items: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.asset(
                            ImageAssets.living,  // Replace with your actual image path
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.asset(
                            ImageAssets.bed,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.asset(
                            ImageAssets.kitchen,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    verticalSpacer(23.h),
                  ],
                ),
              ),
            ),
            verticalSpacer(221.h),
          ],
        ),
      ),
    );
  }
}
