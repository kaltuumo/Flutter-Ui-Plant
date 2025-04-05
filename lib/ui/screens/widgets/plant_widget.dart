import 'package:flutter/material.dart';

import 'package:flutter_ui_plant/ui/models/plants.dart';
import 'package:flutter_ui_plant/ui/screens/detail_page.dart';
import 'package:flutter_ui_plant/utilities/constants.dart';
import 'package:page_transition/page_transition.dart';

////////////////// /// waxaa laga soo sameeyay xogta New Plants
class PlantWidget extends StatelessWidget {
  const PlantWidget({Key? key, required this.index, required this.plantList})
    : super(key: key);

  final int index;
  final List<Plant> plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      ///// ///code kaan waxaa laga soo qrisanaa xogta New Plants ka
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(plantId: plantList[index].plantId),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },

      ///// ///code kaan waxaa laga soo sameeyo xogta New Plants ka
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                // code kaan wuxuu qaabilsanyahay image ka plant
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(plantList[index].imageURL),
                  ),
                ),
                // code kaan wuxuu qaabilsanyahay category and plant Name
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plantList[index].category),
                      Text(
                        plantList[index].plantName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // code kaan wuxuu qaabilsanyahay price ka plant
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'$' + plantList[index].price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
