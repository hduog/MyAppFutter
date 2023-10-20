import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Container BottomBar() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2),
    color: Color.fromARGB(255, 76, 120, 196),
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GNav(
          backgroundColor: Color.fromARGB(255, 76, 120, 196),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          gap: 8,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(icon: Icons.favorite_border, text: 'Love'),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(icon: Icons.settings, text: 'Setting'),
          ]),
    ),
  );
}
