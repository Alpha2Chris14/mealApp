import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function _saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this._saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _gluteenFree = widget.currentFilters["gluten"] as bool;
    _vegetarian = widget.currentFilters["vegetarian"] as bool;
    _vegan = widget.currentFilters["vegan"] as bool;
    _lactoseFree = widget.currentFilters["lactose"] as bool;
    // TODO: implement initState
    super.initState();
  }

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

    void _changeIsVegetarian(value) {
      setState(() {
        _vegetarian = value;
      });
    }

    void _changeIsVegan(value) {
      setState(() {
        _vegan = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "gluten": _gluteenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget._saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
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
              _switchTiles(
                "Lactose-Free",
                "Only include lactose-free meals",
                _lactoseFree,
                _changeIsLactoseFree,
              ),
              _switchTiles(
                "Vegetarian",
                "Only include vegetarian meals",
                _vegetarian,
                _changeIsVegetarian,
              ),
              _switchTiles(
                "Vegan",
                "Only include vegan meals",
                _vegan,
                _changeIsVegan,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
