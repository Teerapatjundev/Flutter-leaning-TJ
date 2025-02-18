import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);
        if (index == 0) Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
        if (index == 1) Navigator.pushNamedAndRemoveUntil(context, AppRoutes.profile, (route) => false);
        if (index == 2) Navigator.pushNamedAndRemoveUntil(context, AppRoutes.counter, (route) => false);

      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "Counter"),
      ],
    );
  }
}
