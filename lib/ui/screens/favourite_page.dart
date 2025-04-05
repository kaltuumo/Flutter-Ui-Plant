import 'package:flutter/material.dart';
import 'package:flutter_ui_plant/ui/models/plants.dart';
import 'package:flutter_ui_plant/ui/screens/widgets/plant_widget.dart';
import 'package:flutter_ui_plant/utilities/constants.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /// code kaan shaqadiisa waa in uu muujiyo liiska dhirta favorite lasoo dhahay
      body:
          widget.favoritedPlants.isEmpty
              ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Your favorited Plants',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
              : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                height: size.height * .5,
                child: ListView.builder(
                  itemCount: widget.favoritedPlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                      index: index,
                      plantList: widget.favoritedPlants,
                    );
                  },
                ),
              ),
    );
  }
}
