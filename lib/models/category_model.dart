import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategory() {
    List<CategoryModel> category = [];

    category.add(CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/food.svg',
        boxColor: Colors.amber));
    category.add(CategoryModel(
        name: 'Strawberry',
        iconPath: 'assets/icons/food.svg',
        boxColor: Colors.pinkAccent));
    category.add(CategoryModel(
        name: 'Grapes',
        iconPath: 'assets/icons/food.svg',
        boxColor: Colors.lightBlue));
    category.add(CategoryModel(
        name: 'Lemon',
        iconPath: 'assets/icons/food.svg',
        boxColor: Colors.limeAccent));
    category.add(CategoryModel(
        name: 'Amla',
        iconPath: 'assets/icons/food.svg',
        boxColor: Colors.lightGreenAccent));

    return category;
  }
}
