import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
class CategoryMealsScreen extends StatefulWidget {
  final String id;
  final String title;
  final Color color;

  CategoryMealsScreen(this.id,this.title,this.color);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;

  List categoryMeals;

  @override
  void iniState(){
    categoryMeals=DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.id);
    } ).toList();
    print(categoryMeals);
    super.initState();
  }
  void _removeMeal(String MealId){
    setState(() {
      categoryMeals.removeWhere((element) => element.id==MealId);
      print("gai");
    });
  }
  @override
  Widget build(BuildContext context) {
    print("reachedhere");

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body:
        ListView.builder(itemBuilder: (ctx,index){
            return MealItem(title: categoryMeals[index].title,
              id :categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              // affordability: categoryMeals[index].affordability,
              // complexity: categoryMeals[index].complexity,
              removeItem:_removeMeal,
                );
      },itemCount:categoryMeals.length,
      ),
    );
  }
}
