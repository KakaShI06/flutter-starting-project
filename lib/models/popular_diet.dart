class PopularDietModal {
  String name;
  String icon;
  String level;
  String duration;
  String calories;
  bool boxSelected;

  PopularDietModal(
      {required this.name,
      required this.icon,
      required this.level,
      required this.calories,
      required this.duration,
      required this.boxSelected});

  static List<PopularDietModal> getpopularDietList() {
    List<PopularDietModal> popularList = [];

    popularList.add(PopularDietModal(
        name: 'Pizza',
        icon: 'assets/icons/pizza.svg',
        level: 'Easy',
        calories: '700',
        duration: '1hr',
        boxSelected: true));
    popularList.add(PopularDietModal(
        name: 'Burger',
        icon: 'assets/icons/pizza.svg',
        level: 'Easy',
        calories: '700',
        duration: '1hr',
        boxSelected: true));
    popularList.add(PopularDietModal(
        name: 'Jalegi',
        icon: 'assets/icons/pizza.svg',
        level: 'Hard',
        calories: '1700',
        duration: '1hr',
        boxSelected: true));
    popularList.add(PopularDietModal(
        name: 'Pasta',
        icon: 'assets/icons/pizza.svg',
        level: 'Easy',
        calories: '700',
        duration: '1hr',
        boxSelected: true));
    popularList.add(PopularDietModal(
        name: 'Bread',
        icon: 'assets/icons/pizza.svg',
        level: 'Easy',
        calories: '700',
        duration: '1hr',
        boxSelected: true));

    return popularList;
  }
}
