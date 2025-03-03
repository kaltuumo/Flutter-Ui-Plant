import 'package:flutter_ui_plant/ui/models/plants.dart';
import 'package:get/get.dart';

class PlantController extends GetxController {
  var bottomNavIndex = 0.obs;
  var favorites = <Plant>[].obs;
  var myCart = <Plant>[].obs;

  void updateBottomNavIndex(int index) {
    bottomNavIndex.value = index;
    favorites.assignAll(Plant.getFavoritedPlants());
    myCart.assignAll(Plant.addedToCartPlants().toSet().toList());
  }
}
