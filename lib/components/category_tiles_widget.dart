import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTilesWidget extends StatefulWidget {
  const CategoryTilesWidget({Key? key}) : super(key: key);

  @override
  State<CategoryTilesWidget> createState() => _CategoryTilesWidgetState();
}

class _CategoryTilesWidgetState extends State<CategoryTilesWidget> {
  final List<String> categoryNames = [
    'All Products',
    'Popular',
    'Recent',
    'Recent',

  ];

  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryNames.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            debugPrint("Category Clicked!");
            setState(() {
              _selectedCategoryIndex = index;
            });
          },
          child: Container(
            width: 110.0,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: _selectedCategoryIndex == index
                  ? Colors.blue
                  : const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                categoryNames[index],
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
