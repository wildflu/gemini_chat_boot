


import 'package:flutter/material.dart';
import 'package:geminiappchat/presontation/components/page_view_components/page_view_login.dart';
import 'package:geminiappchat/presontation/components/page_view_components/page_view_pricing.dart';
import 'package:geminiappchat/presontation/components/page_view_components/page_view_welcome.dart';
import 'package:get/get.dart';

class OnBordingController extends GetxController {
  PageController pvCotroller = PageController();
  bool isLastPage = false;

  List<Widget> pageViewPages = [
    const WelcomeComponent(),
    const PricingComponent(),
    const LastPageViewLoginComponent()
  ];
  getNextPage(){
    pvCotroller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    if(pvCotroller.page == pageViewPages.length -2) {
      isLastPage = true;
      update();
    }
  }
}