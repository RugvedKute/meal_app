import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favourite_screen.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoriteMeal;

  TabScreen(this.favoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'pages': CategoriesScreen(), 'title': 'Categories'},
      {
        'pages': FavouriteScreen(widget.favoriteMeal),
        'title': 'Your favourites'
      }
    ];
    super.initState();
  }

  int selectedindex = 0;
  void SelectNewPage(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages.elementAt(selectedindex)['title']),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: _pages.elementAt(selectedindex)['pages'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedindex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
        onTap: SelectNewPage,
      ),
    );
  }
}
