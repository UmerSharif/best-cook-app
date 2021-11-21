import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screen/filters_screen.dart';
import 'package:meals/screen/meal_deatail_screen.dart';
import 'package:meals/screen/tabs_screen.dart';

import 'models/meal.dart';
import 'screen/catergories_screen.dart';
// import './category_meals_screen.dart';
import 'screen/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      print(filterData);
      // ignore: missing_return
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 5, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      home: TabsScreen(_favouriteMeal),
      // initialRoute: '/',
      routes: {
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeal), // un named arguments
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toggleFavourite: _toggleFavourite,
            isMealFavourite: _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
            saveFilters: _setFilters, currentFilters: _filter) //names arguments
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
