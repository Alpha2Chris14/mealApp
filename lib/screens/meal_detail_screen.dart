import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    // print(routeArgs);
    // var title = routeArgs["title"];
    // var url = routeArgs['url'];

    // print(url);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              selectedMeal.imageUrl,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            elevation: 30,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    selectedMeal.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "Ingredent",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Theme.of(context).colorScheme.background,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                Container(
                  height: 200,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 179, 77, 197),
                          foregroundColor: Colors.white,
                          // foregroundColor: Theme.of(context).primaryColor,
                          child: Text("${index + 1}"),
                        ),
                        // title: Text("Step ${index + 1}"),
                        subtitle: Text("${selectedMeal.steps}"),
                      );
                      // return Column(
                      //   children: [
                      //     Text(
                      //       "${index + 1} . ${selectedMeal.steps}",
                      //       style: const TextStyle(fontSize: 16),
                      //     ),
                      //     const SizedBox(
                      //       height: 10,
                      //     )
                      //   ],
                      // );
                    },
                    itemCount: selectedMeal.steps.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.favorite),
      ),
    );
  }
}
