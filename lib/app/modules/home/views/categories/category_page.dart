import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Text('Category Page'),
      ),
      body: Center(
        child: Text('Category Page'),
      ),
    );
  }
}
