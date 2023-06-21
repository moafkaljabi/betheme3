import 'package:betheme/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_strings.dart';
import 'fade_in_animation_controller.dart';


class MFadeInAnimation extends StatelessWidget {
   MFadeInAnimation({
    super.key,

    required this.durationInMs,
    required this.child,
    
    // can be null so we dont write "required"
    this.animate,
    
  });


final controller = Get.put(FadeInAnimationController());
final int durationInMs;
final MAnimatePosition? animate; 
final Widget child;


  @override
  Widget build(BuildContext context) {
    return Obx(()=> AnimatedPositioned(
        duration: const Duration(milliseconds: 1600),
        top: controller.animate.value ? animate!.topAfter: animate!.topBefore, 
        left: controller.animate.value ? animate!.leftAfter: animate!.leftBefore,
        bottom: controller.animate.value? animate!.bottomAfter: animate!.bottomBefore,
        right: controller.animate.value? animate!.rightAfter:animate!.rightBefore,

        child: AnimatedOpacity(
            opacity: controller.animate.value? 1 : 0 , 
            duration: Duration(microseconds: durationInMs),
            child: child,
            //child: Image.asset(tSplashTopIcon)
            ),
             ),);
  }
}