import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/screens/categories_meals_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tab_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !element.isLactoseFree) {
          return false;
        }

        if (_filters["vegan"] == true && !element.isVegan) {
          return false;
        }

        if (_filters["vegetarian"] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //just did a code review
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                // fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromARGB(255, 238, 230, 240),
        fontFamily: 'Raleway',
      ),
      // home: const CategoriesScreen(),
      initialRoute: "/",
      routes: {
        '/': (ctx) => const TabScreen(),
        CategoriesMealsScreen.routeName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      //a fallback page
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoriesMealsScreen(_availableMeals));
      },

      //a like 404 page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoriesMealsScreen(_availableMeals));
      },
    );
  }
}
