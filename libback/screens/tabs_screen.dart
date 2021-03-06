import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'category_screen.dart';
import 'fav_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Widget>_pages=[
  //   CategoryScreen(),
  //   FavScreen(),
  // ];
  final List<Map<String, Object>> _pages=[
    {'page':CategoryScreen(),'title':"Categories"},
    {'page':FavScreen(),'title':"Favorites"},
  ];
  int _selectedpageindex=0;
  void _selectPage(int index){
    setState(() {
      _selectedpageindex=index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text(_pages[_selectedpageindex]['title']),),
        drawer: MainDrawer(),
        body: _pages[_selectedpageindex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow,
          currentIndex: _selectedpageindex,

          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),
                title: Text("Categories")),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),
            title: Text("Favorite"))
          ],
        ),
      );
  }
}
