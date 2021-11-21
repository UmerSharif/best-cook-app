import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> catergoryMeal;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final categoryId = routeArgs["id"];
    catergoryMeal = widget.availableMeal
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  void _removeItem(String mealId) {
    setState(() {
      catergoryMeal.removeWhere((element) => mealId == element.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: catergoryMeal[index].id,
                affordability: catergoryMeal[index].affordability,
                complexity: catergoryMeal[index].complexity,
                duration: catergoryMeal[index].duration,
                imageUrl: catergoryMeal[index].imageUrl,
                title: catergoryMeal[index].title,
                removeItem: _removeItem);
          },
          itemCount: catergoryMeal.length,
        ));
  }
}
