import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_meals_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //just did a code review
  // This widget is the root of your application.
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
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      //a fallback page
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesMealsScreen());
      },

      //a like 404 page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesMealsScreen());
      },
    );
  }
}
