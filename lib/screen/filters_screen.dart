import 'package:flutter/material.dart';
import 'package:meals/widgets/maim_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  const FiltersScreen({this.setFilters, key}) : super(key: key);
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _luctoseFree = false;

  Widget _buildSwitchListTile(
      bool value, String title, String subtitle, Function updateVaue) {
    return SwitchListTile(
        title: Text('$title'),
        value: value,
        subtitle: Text('$subtitle'),
        onChanged: updateVaue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fiters'),
          actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    _glutenFree, "Gluten-free", 'Only include gluten-free meal',
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    _vegetarian, "Vegetarian", 'Only include vegetarian meal',
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(_vegan, "Vegan", 'Only include vegan meal',
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(_luctoseFree, "Luctose-free",
                    'Only include luctose-free meal', (newValue) {
                  setState(() {
                    _luctoseFree = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
