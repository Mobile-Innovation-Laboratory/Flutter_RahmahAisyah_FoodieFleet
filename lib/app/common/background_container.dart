import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer(
      {super.key, required this.child, required this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
            image: AssetImage("assets/images/restaurant_bk.png"),
            fit: BoxFit.cover,
            opacity: .7),
      ),
      child: child,
    );
  }
}
