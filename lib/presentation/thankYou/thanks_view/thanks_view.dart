import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

import '../../../resources/assets_manager.dart';

class ThanksView extends StatefulWidget {
  const ThanksView({super.key});

  @override
  _ThanksViewState createState() => _ThanksViewState();
}

class _ThanksViewState extends State<ThanksView> {
  late ConfettiController _leftConfettiController;
  late ConfettiController _rightConfettiController;

  @override
  void initState() {
    super.initState();
    _leftConfettiController = ConfettiController(duration: const Duration(seconds: 3));
    _rightConfettiController = ConfettiController(duration: const Duration(seconds: 3));

    // Start confetti when the screen opens
    Future.delayed(const Duration(milliseconds: 500), () {
      _leftConfettiController.play();
      _rightConfettiController.play();
    });
  }

  @override
  void dispose() {
    _leftConfettiController.dispose();
    _rightConfettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Balloon Image
          Center(
            child: Image.asset(
              ImageAssets.ballon,
              width: 300.w,
              height: 300.h,
            ),
          ),

          /// Left Confetti (Flying from left to right)
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _leftConfettiController,
              blastDirection: 0, // Rightward direction
              emissionFrequency: 0.05,
              numberOfParticles: 5,
              maxBlastForce: 20, // Speed
              minBlastForce: 10,
              gravity: 0.1,
              colors: _confettiColors(),
            ),
          ),

          /// Right Confetti (Flying from right to left)
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _rightConfettiController,
              blastDirection: pi, // Leftward direction
              emissionFrequency: 0.05,
              numberOfParticles: 5,
              maxBlastForce: 20,
              minBlastForce: 10,
              gravity: 0.1,
              colors: _confettiColors(),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _confettiColors() {
    return [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple, Colors.orange];
  }
}
