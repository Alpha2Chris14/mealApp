import 'package:flutter/material.dart';
import 'package:mealapp/screens/favourite.dart';

import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DeliMeal"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "All",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favourite",
            )
          ]),
        ),
        body: const TabBarView(children: [CategoriesScreen(), Favourite()]),
      ),
    );
  }
}
