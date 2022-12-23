import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/search.dart';
import "pages/account.dart";
import "pages/home.dart";
import "pages/reels.dart";
import "pages/shop.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = const [
    UserHome(),
    UserReels(),
    UserSearch(),
    UserShop(),
    UserAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          // more than 4 items makes them desappear, so we need to make the items fixed
          onTap: _navigateBottomNavBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call), label: "reels"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "shop"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "account"),
          ]),
    );
  }
}
