import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import 'package:meals_app/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadedinitdata=false;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedinitdata){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedinitdata=true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
     setState(() {
       categoryMeals.removeWhere((element) => element.id==mealId);
     });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
