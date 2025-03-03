import 'package:flutter/material.dart';
import 'package:flutter_ui_plant/utilities/constants.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
