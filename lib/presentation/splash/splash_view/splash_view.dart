import 'dart:async';

import 'package:chairy_app/resources/assets_manager.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/constants.dart';
import '../../../resources/routes_manager.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer?  timer;

  startDelay() {
    timer = Timer(const Duration(seconds: AppConstants.splashDelay), goNext);
  }
  goNext() {
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?ColorManager.black:ColorManager.white,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
