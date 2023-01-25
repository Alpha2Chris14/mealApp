import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favourite extends StatelessWidget {
  List<Meal> favoriteMeals;
  Favourite(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset("assets/images/no-transactions.png"),
            Text(
              "No Favourite Yet",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            deleteItem: () {},
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
