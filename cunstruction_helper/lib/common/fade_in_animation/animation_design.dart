import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';



class AppFadeAnimation extends StatelessWidget {
  AppFadeAnimation(
      {super.key,
      required this.durationInMs,
      this.animatePosition,
      required this.child});

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final AnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: controller.animate.value
              ? animatePosition!.topAfter
              : animatePosition!.topBefore,
          left: controller.animate.value
              ? animatePosition!.leftAfter
              : animatePosition!.leftBefore,
          right: controller.animate.value
              ? animatePosition!.rightAfter
              : animatePosition!.rightBefore,
          bottom: controller.animate.value
              ? animatePosition!.bottunAfter
              : animatePosition!.bottunBefore,
          child:child ),
    );
  }
}

