import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtomNav extends StatelessWidget {
  final void Function(int)? onTabChange;
  ButtomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey[700],
          tabActiveBorder: Border.all(color: Colors.grey.shade100),
          tabBackgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(icon: Icons.home, text: 'Shop'),
            GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          ]),
    );
  }
}
