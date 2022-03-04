import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import '../dummy_data.dart';

class MealItemScreen extends StatelessWidget {
  static const routeName = '/meal-item';

  final Function toggleFavorite;
   Function isFavorite;

  MealItemScreen(this.toggleFavorite, this.isFavorite);

  Widget theTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget theBox(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    final categoryMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                categoryMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            theTitle(context, 'Ingredients'),
            theBox(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      categoryMeal.ingredients[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  elevation: 4,
                ),
                itemCount: categoryMeal.ingredients.length,
              ),
            ),
            theTitle(context, 'Steps'),
            theBox(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(categoryMeal.steps[index]),
                  leading: CircleAvatar(
                    child: Text('#${index + 1}'),
                  ),
                ),
                itemCount: categoryMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => toggleFavorite(categoryId),
        child: 
          Icon(
            isFavorite(categoryId)? Icons.star: Icons.star_border
          )


        
      ),
    );
  }
}
