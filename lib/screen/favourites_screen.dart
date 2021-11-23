import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  const FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text("NO Favourite Meal"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
