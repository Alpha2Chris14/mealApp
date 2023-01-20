import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    print(routeArgs);
    var title = routeArgs["title"];
    var url = routeArgs['url'];

    print(url);

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        children: [
          Image.network(url as String),
          Text(title as String),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.favorite),
      ),
    );
  }
}
