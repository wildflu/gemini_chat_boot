

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:geminiappchat/controller/onborgin_controller.dart';
import 'package:geminiappchat/presontation/pages/auth/login_page.dart';
import 'package:geminiappchat/presontation/pages/auth/register_page.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF79FCC8),
              Colors.black
            ]
          )
        ),
        child: GetBuilder<OnBordingController>(
              init: OnBordingController(),
              builder: (controller) {
                return Stack(
                      children: [
                        PageView(
                          controller: controller.pvCotroller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: controller.pageViewPages,
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: controller.isLastPage
                          ? Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 2, color: Color(0xFF79FCC8))
                                  ),
                                  onPressed: ()=> Get.off(()=> const RegisterPage()), child: const Text('Register', style: TextStyle(color: Color(0xFF79FCC8)),)),
                              ).animate().fade(duration: const Duration(milliseconds: 500), delay: const Duration(milliseconds: 100)),
                              const Gap(5),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 2, color: Color(0xFF79FCC8))
                                  ),
                                  onPressed: ()=> Get.off(()=> const LoginPage()), child: const Text('Sign In', style: TextStyle(color: Color(0xFF79FCC8)),)
                                ),
                              ).animate().fade(duration: const Duration(milliseconds: 500), delay: const Duration(milliseconds: 100))
                            ],
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(  
                                controller: controller.pvCotroller,  
                                count:  controller.pageViewPages.length,  
                                effect: const WormEffect(
                                  activeDotColor: Color(0xFF79FCC8),
                                  dotColor: Colors.white10,
                                  dotHeight: 10,
                                ), 
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: const Color(0xFF79FCC8),
                                  padding: const EdgeInsets.all(12)
                                ),
                                onPressed: () => controller.getNextPage(),
                                icon: const Icon(Icons.navigate_next, color: Colors.white, size: 25,)
                              ),
                            ],
                          )
                        ),
                      ],
                    );
              },
            ),
      ),
    );
  }
}


