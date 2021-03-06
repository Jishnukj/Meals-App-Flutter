import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/flutter%20projects/flutter%20course%20demo%20apps/meals_app/lib/screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color _color;
  CategoryItem(this.id,this.title,this._color);
  void selectCategory(BuildContext ctx){
    print("moving to nextscreen");
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_){
        return CategoryMealsScreen(id,title,_color);
      }
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),

        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_color.withOpacity(0.7),_color]),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
