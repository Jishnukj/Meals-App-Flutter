import 'package:flutter/material.dart';
import 'file:///E:/flutter%20projects/flutter%20course%20demo%20apps/meals_app/lib/widgets/category_list.dart';
import '../dummy_data.dart';
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((cateData) => CategoryItem(
          cateData.id,
          cateData.title,
          cateData.color,
        )).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

      );

  }
}
