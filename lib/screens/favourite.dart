import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';

class Favourite extends StatelessWidget {
  List<Meal> favoriteMeals;
  Favourite(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
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
  }
}
