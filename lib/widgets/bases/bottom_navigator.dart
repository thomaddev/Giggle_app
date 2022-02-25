import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class BottomNavigator extends StatelessWidget {
  final Function(int) onChangeScreen;
  final int currentIndex;
  const BottomNavigator({Key? key, required this.onChangeScreen, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.EXAMPLE_COLOR,
      onTap:(newIndex) => onChangeScreen(newIndex),
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_bar),
          label: 'Bar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Blog',
        ),
      ],
    );
  }
}
