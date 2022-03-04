import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filter_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.amber[400],
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: 'RobotoCondense'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(
            Icons.dining,
            size: 40,
          ),
          title: Text(
            'Meals',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 40,
          ),
          title: Text(
            'Filters',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          },
        )
      ],
    );
  }
}
