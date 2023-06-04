import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:manula_perera_flutter_interview/components/main_container_widget.dart';
import '../components/bottom_navigation.dart';
import '../components/category_tiles_widget.dart';
import '../components/products_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String fontFamily = 'Roboto';
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Flutter Menu Demo'),
        leading: IconButton(
          icon: const Icon(
            Ionicons.menu_outline,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            debugPrint('Menu button pressed!');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Ionicons.search_outline,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              debugPrint('Search button pressed!');
            },
          ),
          IconButton(
            icon: const Icon(
              Ionicons.bag_handle_outline,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              debugPrint('Checkout button pressed!');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  //-------- the main text
                  child: Text(
                    'Enjoy the world \ninto virtual reality',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const MainContainerWidget(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 0),
                  child: SizedBox(
                    height: 40.0,
                    child: CategoryTilesWidget(),
                  ),
                ),
                // Expanded(child: const Products()),
                const SizedBox(
                  height: 298,
                    child: Products())
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
