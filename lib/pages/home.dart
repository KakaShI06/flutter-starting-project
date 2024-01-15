import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_application_1/models/diet_mode.dart';
import 'package:flutter_application_1/models/popular_diet.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> category = [];
  List<DietModel> dietCategory = [];
  List<PopularDietModal> popularCategory = [];

  void _getCategory() {
    category = CategoryModel.getCategory();
  }

  void _getDietCategory() {
    dietCategory = DietModel.getDietModel();
  }

  void _getPopularCategory() {
    popularCategory = PopularDietModal.getpopularDietList();
  }

  @override
  Widget build(BuildContext context) {
    _getCategory();
    _getDietCategory();
    _getPopularCategory();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(children: [
        _searchBar(),
        const SizedBox(height: 30),
        _getCategorySection(),
        const SizedBox(height: 30),
        _getRecommendationSection(),
        const SizedBox(height: 30),
        _getPopularSection(),
        const SizedBox(height: 20),
      ]),
    );
  }

  Column _getPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            'Popular Dishes in Breakfast',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0)
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset(popularCategory[index].icon),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularCategory[index].name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '${popularCategory[index].level} | ${popularCategory[index].calories} | ${popularCategory[index].duration}',
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 16),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/forward-icons.svg',
                          width: 30,
                          height: 25,
                        ),
                      )
                    ]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: popularCategory.length)
      ],
    );
  }

  Column _getRecommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation for Diet',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          height: 240,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: dietCategory[index].bgColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: SizedBox(
                            height: 75,
                            child:
                                SvgPicture.asset(dietCategory[index].iconPath),
                          ),
                        ),
                        Text(
                          dietCategory[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                        Text(
                          '${dietCategory[index].level} | ${dietCategory[index].calories} | ${dietCategory[index].duration}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.blueGrey),
                        ),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    dietCategory[index].viewIsSelected
                                        ? Color.fromARGB(255, 73, 131, 197)
                                        : Colors.transparent,
                                    dietCategory[index].viewIsSelected
                                        ? Color.fromARGB(255, 15, 74, 238)
                                        : Colors.transparent
                                  ])),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: dietCategory[index].viewIsSelected
                                    ? Colors.white70
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemCount: dietCategory.length),
        )
      ],
    );
  }

  Column _getCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          color: Colors.white,
          child: ListView.separated(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: category[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(category[index].iconPath),
                        ),
                      ),
                      Text(
                        category[index].name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.01)
      ]),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Dishes!',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: SizedBox(
                height: 20,
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                )),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      endIndent: 10,
                      indent: 10,
                    ),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, top: 2, bottom: 2, left: 2),
                          child: SvgPicture.asset('assets/icons/filter.svg'),
                        )),
                  ],
                ),
              ),
            ),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            'assets/icons/cheron-left.svg',
            height: 20,
            width: 30,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              height: 20,
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}
