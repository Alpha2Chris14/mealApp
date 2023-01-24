import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    // _switchTiles("Gluten-Free","Only include gluten-free meals. ",_gluteenFree)
    Widget _switchTiles(
        String title, String subtitle, bool value, Function updateValue) {
      return SwitchListTile(
        activeColor: Colors.purple,
        title: Text(title),
        value: value,
        onChanged: (value) => updateValue(value),
        subtitle: Text(subtitle),
      );
    }

    void _changeIsGluttenFree(value) {
      setState(() {
        _gluteenFree = value;
      });
    }

    void _changeIsLactoseFree(value) {
      setState(() {
        _lactoseFree = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _switchTiles(
                "Gluten-Free",
                "Only include gluten-free meals. ",
                _gluteenFree,
                _changeIsGluttenFree,
              ),
              _switchTiles("Lactose-Free", "Only include lactose-free meals",
                  _lactoseFree, _changeIsLactoseFree)
            ],
          ))
        ],
      ),
    );
  }
}
