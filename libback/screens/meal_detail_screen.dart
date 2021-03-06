import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
   final String mealid;
   MealDetailScreen({this.mealid});
  @override

  Widget build(BuildContext context) {
    final selectedmeal=DUMMY_MEALS.firstWhere((element) => element.id==mealid);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedmeal.title}"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedmeal.imageUrl,fit: BoxFit.cover,),


            ),
           Container(
             margin: EdgeInsets.symmetric(vertical: 10),
             child:Text("ingrediants",style: Theme.of(context).textTheme.title,),
           ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,width: MediaQuery.of(context).size.width-30,child: ListView.builder(
                itemCount: selectedmeal.ingredients.length,
            itemBuilder: (context,index)=>Card(
              child: Padding(padding:EdgeInsets.symmetric(),
                  child: Text(selectedmeal.ingredients[index])),
            )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:Text("Steps",style: Theme.of(context).textTheme.title,),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,width: MediaQuery.of(context).size.width-30,child: ListView.builder(
                itemCount: selectedmeal.steps.length,
                itemBuilder: (context,index)=>Card(
                  child: Padding(padding:EdgeInsets.symmetric(),
                      child: Text("${index+1}. ${selectedmeal.steps[index]}")),
                )),
            ),
            SizedBox(height: 50,)
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealid);
        },
      ),
    );
  }
}
