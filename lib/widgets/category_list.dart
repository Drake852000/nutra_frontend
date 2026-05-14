import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CategoryList extends StatefulWidget {

  const CategoryList({super.key});

  @override
  State<CategoryList> createState() =>
      _CategoryListState();
}

class _CategoryListState
    extends State<CategoryList> {

  final List<String> categories = [

    'Fitness',
    'Keto',
    'Vegano',
    'Low Carb',
    'Alta proteína',
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 45,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: categories.length,

        itemBuilder: (context, index) {

          final category =
              categories[index];

          final isSelected =
              selectedCategory == index;

          return GestureDetector(

            onTap: () {

              setState(() {

                selectedCategory =
                    index;
              });
            },

            child: Container(

              margin:
                  const EdgeInsets.only(
                right: 12,
              ),

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),

              decoration: BoxDecoration(

                color: isSelected
                    ? AppColors.primary
                    : Colors.white,

                borderRadius:
                    BorderRadius.circular(30),
              ),

              child: Text(

                category,

                style: TextStyle(

                  color: isSelected
                      ? Colors.white
                      : Colors.black,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}