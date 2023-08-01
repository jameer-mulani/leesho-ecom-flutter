import 'package:flutter/material.dart';


class LeeshoAppBottomNavBar extends StatefulWidget {
  const LeeshoAppBottomNavBar({Key? key, required this.onTabChangeCallback}) : super(key: key);

  final void Function(int index) onTabChangeCallback;

  @override
  State<LeeshoAppBottomNavBar> createState() => _LeeshoAppBottomNavBarState();
}

class _LeeshoAppBottomNavBarState extends State<LeeshoAppBottomNavBar> {

  var _currentTabIndex = 0;
  void _onTabChange(int index) {
    setState(() {
      _currentTabIndex = index;
    });
    widget.onTabChangeCallback(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withRed(100),
            )),
/*        BottomNavigationBarItem(
            icon: const Icon(Icons.category_outlined),
            label: "Categories",
            activeIcon: Icon(
              Icons.category_outlined,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withRed(100),
            )),*/
        BottomNavigationBarItem(
            icon: const Icon(Icons.star_border_outlined),
            label: "Favorites",
            activeIcon: Icon(
              Icons.star_border_outlined,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withRed(100),
            ))
      ],
      currentIndex: _currentTabIndex,
      elevation: 2,
      onTap: _onTabChange,
    );
  }
}
