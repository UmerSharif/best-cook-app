import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryMealScreen({this.id, this.color, this.title, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("Recipe"),
      ),
    );
  }
}
