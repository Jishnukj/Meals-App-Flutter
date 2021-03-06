import 'package:flutter/material.dart';
import 'file:///E:/flutter%20projects/flutter%20course%20demo%20apps/meals_app/lib/screens/category_meals_screen.dart';
import 'file:///E:/flutter%20projects/flutter%20course%20demo%20apps/meals_app/lib/screens/category_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("hai");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225,254,229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(),

    );
  }
}


