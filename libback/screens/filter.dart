import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter"),),
      drawer: MainDrawer(),
      body: Center(),
    );
  }
}
