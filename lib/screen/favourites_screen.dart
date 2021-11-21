import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  const FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Favourite'),
    );
  }
}
