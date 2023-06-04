import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  final List<String> navItems = [
    'nav 1',
    'nav 2',
    'nav 3',
    'nav 4',

  ];
  // int _selectedNav = 0;

   MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTabSelected,
      items:  <BottomNavigationBarItem>[
        //--- Define the items in the bottom navigation bar
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () => debugPrint("Home Clicked!"),
            child: const Icon(
                Icons.home_outlined,
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () => debugPrint("nav 2 Clicked!"),
            child: const Icon(
                Icons.send_outlined,
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              // setState(() {
              //   _selectedNav = index;
              // });
            },
            child: const Icon(
                Icons.favorite_outline_rounded,
              // color: _selectedNav == index
              //     ? Colors.blue
              //     : const Color(0xFFEEEEEE),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () => debugPrint("nav 4 Clicked!"),
            child: const Icon(
                Icons.person_outline_rounded,
              size: 30,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}