import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String ,bool> CurrentFilter;
  final Function saveFilter;
  FiltersScreen(this.saveFilter,this.CurrentFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lacoseFree=false;
  @override
  void initState() {
    // TODO: implement initState
    _glutenFree=widget.CurrentFilter['gluten'];
    _lacoseFree=widget.CurrentFilter['lactose'];
    _vegan=widget.CurrentFilter['vegan'];
    _vegetarian=widget.CurrentFilter['vegetarian'];

    super.initState();
  }
  Widget _buildSwitchListTile(String title,String Subtitle,bool currentValue,Function updateValue) {
    return SwitchListTile(title: Text(title),
    subtitle: Text(Subtitle),
    value: currentValue,
    onChanged: updateValue,);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [IconButton(icon: Icon(Icons.save),
          onPressed: (){
          final selectedFilters={

          'gluten': _glutenFree,
          'lactose' : _lacoseFree,
          'vegan' :_vegan,
          'vegetarian' : _vegetarian

          };
          widget.saveFilter(selectedFilters);},)],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
            style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
            child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _glutenFree,
                        (newValue) {
                      setState(
                            () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lacoseFree,
                        (newValue) {
                      setState(
                            () {
                          _lacoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _vegetarian,
                        (newValue) {
                      setState(
                            () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals.',
                    _vegan,
                        (newValue) {
                      setState(
                            () {
                          _vegan = newValue;
                        },
                      );
                    },
                  )
                ],
            ),
          ),
        ],
      ),
    );
  }
}

