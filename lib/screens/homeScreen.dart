import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:manula_perera_flutter_interview/components/mainContainerWidget.dart';
import '../components/bottomNavigation.dart';
import '../components/categoryTilesWidget.dart';
import '../components/productsCard.dart';

class HomeScreen extends StatefulWidget {
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

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Favorites'),
    Text('Settings'),
    Text('Profile'),
  ];

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
            print('Menu button pressed!');
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
              print('Search button pressed!');
            },
          ),
          IconButton(
            icon: const Icon(
              Ionicons.bag_handle_outline,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              print('Checkout button pressed!');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Products(),
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
