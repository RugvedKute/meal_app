import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../widgets/category_item.dart';

class CatergoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((tx) {
          return CategoryItem(tx.id, tx.title, tx.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2),
      ),
    );
  }
}
