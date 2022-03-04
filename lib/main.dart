import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screens/filter_screen.dart';
import './screens/meal-item-screen.dart';
import './screens/tab_bar_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenfree': false,
    'lactose': false,
    'vegeterian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void _toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favouriteMeals.removeAt(existingIndex);
    } else {
      setState(() {
        favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isFavorite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  void filtermeal(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenfree'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealItemScreen.routeName: (ctx) => MealItemScreen(_toggleFavourite, isFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(filtermeal, _filters),
      },
    );
  }
}
