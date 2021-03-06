

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
class MealItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final String id;
  final Function removeItem;
  // final Complexity complexity;
  // final Affordability affordability;
  MealItem({
    @required this.id,
   @required  this.title,
    @required this.imageUrl,
    // @required this.affordability,
    // @required this.complexity,
    @required this.duration,
    @required this.removeItem,
});

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    print("reached");
    return InkWell(
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          MealDetailScreen(mealid: widget.id,),)).then((result) => {
            print(result),
        if(result!=null){
          widget.removeItem(result),
        }
      });},
      child: Card(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(children: [
          Stack(children: [
            ClipRRect(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),topRight: Radius.circular(15)
            ),
              child: Image.network(widget.imageUrl,height: 250,width: double.infinity,
              fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 20,
            right: 10,
              child: Container(
                width: 300,
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Text(widget.title,style: TextStyle(
                  fontSize: 26,
                  color: Colors.white
                ),softWrap: true,
                overflow: TextOverflow.fade,),
              ),
            )
          ],
          ),
          Padding(padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text('${widget.duration} min'),
                ],
              ),

            ],
          ),
          )
        ],
        ),
      ),
    );
  }
}
