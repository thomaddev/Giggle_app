import 'package:flutter/material.dart';
import '../../constants/app_color.dart';

class MainTopBar extends StatefulWidget implements PreferredSizeWidget {
  const MainTopBar({Key? key})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainTopBarState createState() => _MainTopBarState();
}

class _MainTopBarState extends State<MainTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: AppColors.APP_BAR,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'Giggle',
        style: TextStyle(color: AppColors.FONT_COLOR),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: AppColors.EXAMPLE_COLOR,
            child: Icon(
              Icons.person,
              color: Colors.blueGrey,
              size: 35.0,
            ),
          ),
        )
      ],
    );
  }
}
