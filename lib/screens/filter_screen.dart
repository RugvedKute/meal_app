import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = './filter_screen';

  final Function filtermeal;
  final Map<String, bool> currentFilters;

  FilterScreen(this.filtermeal, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenfree'];
     _lactoseFree = widget.currentFilters['lactose'];
      _vegeterian = widget.currentFilters['vegeterian'];
       _vegan = widget.currentFilters['vegan'];
    
    super.initState();
  }

  Widget switchList(
      String title, String subtitle, var value, Function updateVal) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updateVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> _filter = {
                'glutenfree': _glutenFree,
                'lactose': _lactoseFree,
                'vegeterian': _vegeterian,
                'vegan': _vegan,
              };

              widget.filtermeal(_filter);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchList(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              switchList('Lactose-free', 'Only include lactose-free meals',
                  _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              switchList(
                  'Vegeterian', 'Only include vegeterian meals', _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              switchList('Vegan', 'Only include Vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
