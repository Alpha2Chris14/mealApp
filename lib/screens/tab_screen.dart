import 'package:flutter/material.dart';
import 'package:mealapp/screens/favourite.dart';
import 'package:mealapp/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> tabScreen = [
    {"title": "DeliMeal", "page": const CategoriesScreen()},
    {"title": "Favourite", "page": const Favourite()},
  ];
  int _tabSelected = 0;
  void _selectedTab(index) {
    setState(() {
      _tabSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabScreen[_tabSelected]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: tabScreen[_tabSelected]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabSelected,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        onTap: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite"),
        ],
      ),
    );
  }
}
