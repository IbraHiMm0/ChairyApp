

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// **Carousel Image Builder**
Widget buildCarouselImage(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.r),
    child: Image.asset(
      imagePath,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}