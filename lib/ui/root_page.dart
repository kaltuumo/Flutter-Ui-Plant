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

///// PAGE KAAN WUXUU QAABILSANYAHAY IN BOTTON NAVIGATION BAR KASTE XOGTIISA UU HELO
// ignore: must_be_immutable
class RootPage extends StatelessWidget {
  final PlantController rootController = Get.put(PlantController());

  RootPage({Key? key}) : super(key: key);

  /// code kaan dhamaan navigation bar ku soo aqrinaa xoga lagu qoray
  List<Widget> _widgetOptions() {
    // navigator kaan wuxuu ka kooban yahay 4 page
    // HomePage, FavoritePage, CartPage, ProfilePage
    // HomePage wuxuu ka kooban yahay dhirta cusub
    // FavoritePage wuxuu ka kooban yahay dhirta favorite
    // CartPage wuxuu ka kooban yahay dhirta la iibsaday
    // ProfilePage wuxuu ka kooban yahay profile ka userka
    return [
      const HomePage(),
      FavoritePage(favoritedPlants: rootController.favorites),
      CartPage(addedToCartPlants: rootController.myCart),
      const ProfilePage(),
    ];
  }

  // code kan page kaste wuxuu leeyahay icon
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // code kan page kaste wuxuu leeyahay title
  // title kaan wuxuu ka kooban yahay Home, Favorite, Cart, Profile
  List<String> titleList = ['Home', 'Favorite', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // code kaan  dhaman pages ka wuxuu siinayaa page name ka and icon notification
      // code kaan wuxuu ku darayaa app bar
      // app bar kaan wuxuu leeyahay title iyo icon
      // title kaan wuxuu ka kooban yahay Home, Favorite, Cart, Profile
      // icon kaan wuxuu leeyahay notification
      // icon kaan wuxuu leeyahay size 30.0
      // icon kaan wuxuu leeyahay color black
      // icon kaan wuxuu leeyahay font size 24
      // icon kaan wuxuu leeyahay font weight 500
      // icon kaan wuxuu leeyahay font family
      // icon kaan wuxuu leeyahay font style normal
      appBar: AppBar(
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // code kan page kaste wuxuu leeyahay title
              // title kaan wuxuu ka kooban yahay Home, Favorite, Cart, Profile
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
      // code kaan wuxuu ku soo aqrinaa every page xogta lagu qoray
      body: Obx(
        () => IndexedStack(
          index: rootController.bottomNavIndex.value,
          children: _widgetOptions(),
        ),
      ),

      // code kaan wuxuu ku darayaa button floating action button
      // button kaan wuxuu ku darayaa page cusub oo scan ah
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

      ///  // code kaan wuxuu ku qaabilsanyahay bottom naviagtion Bars
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
