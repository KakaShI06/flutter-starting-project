import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;
  Color bgColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.bgColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getDietModel() {
    List<DietModel> dietList = [];

    dietList.add(DietModel(
        name: 'Pasta',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '500',
        viewIsSelected: true,
        bgColor: Colors.redAccent));
    dietList.add(DietModel(
        name: 'Cake',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '500',
        viewIsSelected: false,
        bgColor: Colors.pinkAccent));
    dietList.add(DietModel(
        name: 'Pizza',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '500',
        viewIsSelected: true,
        bgColor: Colors.purpleAccent));
    dietList.add(DietModel(
        name: 'Burger',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '500',
        viewIsSelected: true,
        bgColor: Colors.blueAccent));
    dietList.add(DietModel(
        name: 'Cake',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '500',
        viewIsSelected: false,
        bgColor: Colors.lightGreenAccent));
    return dietList;
  }
}
