import 'package:get/get.dart';

class PageController extends GetxController {
  var myIndex = 0.obs; // Observable variable to hold the current index

  // Method to update the current index
  void changePage(int page) {
    myIndex.value = page;
  }
}
