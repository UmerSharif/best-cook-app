import 'package:flutter/material.dart';
import 'package:meals/widgets/maim_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key key}) : super(key: key);
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fiters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('filters'),
      ),
    );
  }
}
