import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;
  // final Color color;
  // const CategoryMealScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final categoryId = routeArgs["id"];
    final catergoryMeal = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                affordability: catergoryMeal[index].affordability,
                complexity: catergoryMeal[index].complexity,
                duration: catergoryMeal[index].duration,
                imageUrl: catergoryMeal[index].imageUrl,
                title: catergoryMeal[index].title);
          },
          itemCount: catergoryMeal.length,
        ));
  }
}
