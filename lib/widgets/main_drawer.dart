import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tab_screen.dart';
import 'package:mealapp/widgets/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            color: Colors.purple,
            child: Column(
              children: const [
                Icon(
                  Icons.food_bank_outlined,
                  color: Colors.white,
                ),
                Text(
                  "DeliMeal",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Color.fromARGB(255, 236, 206, 241),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerItem(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          DrawerItem("Settings", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
