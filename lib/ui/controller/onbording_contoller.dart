import 'package:flutter/material.dart';
import 'package:flutter_ui_plant/ui/screens/signin_page.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs; // Observable state
  var isLastPage = false.obs; // To track if it's the last page

  void nextPage(PageController pageController) {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      isLastPage.value = true; // Mark as last page
    }
  }

  void skipToSignin(BuildContext context) {
    Get.offAll(() => const SigninPage()); // Navigate to the Signin page
  }
}
