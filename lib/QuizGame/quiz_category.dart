import 'package:flutter/material.dart';

class QuizCategory {
  final String name;
  final int id;

  QuizCategory({required this.name, required this.id});
}

class QuizCategoryPage extends StatelessWidget {
  final List<QuizCategory> categories;
  final Function(int) onSelectCategory;

  QuizCategoryPage({required this.categories, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategorie auswählen'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            onTap: () => onSelectCategory(categories[index].id),
          );
        },
      ),
    );
  }
}
