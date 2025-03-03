import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_plant/ui/controller/plant_controller.dart';
import 'package:flutter_ui_plant/ui/scan_page.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_plant/ui/screens/cart_page.dart';
import 'package:flutter_ui_plant/ui/screens/favourite_page.dart';
import 'package:flutter_ui_plant/ui/screens/home_page.dart';
import 'package:flutter_ui_plant/ui/screens/profile_page.dart';
import 'package:flutter_ui_plant/utilities/constants.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class RootPage extends StatelessWidget {
  final PlantController rootController = Get.put(PlantController());

  RootPage({Key? key}) : super(key: key);

  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(favoritedPlants: rootController.favorites),
      CartPage(addedToCartPlants: rootController.myCart),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = ['Home', 'Favorite', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleList[rootController.bottomNavIndex.value],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Icon(
                Icons.notifications,
                color: Constants.blackColor,
                size: 30.0,
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Obx(
        () => IndexedStack(
          index: rootController.bottomNavIndex.value,
          children: _widgetOptions(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: rootController.bottomNavIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            rootController.updateBottomNavIndex(index);
          },
        ),
      ),
    );
  }
}
