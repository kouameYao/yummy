import 'package:flutter/material.dart';
import 'package:yummy/screens/about_screen.dart';
import 'package:yummy/screens/profile_screen.dart';
import 'package:yummy/screens/settings_screen.dart';
import 'package:yummy/widgets/drawer.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'login.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": HomeScreen(), "title": "Home Page"},
      {"page": FavoriteScreen(), "title": "Favorite Screen"},
      {"page": ProfileScreen(), "title": "Profile Screen"},
      {"page": SettingsScreen(), "title": "Settings Screen"},
      {"page": AboutScreen(), "title": "About screen"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]["title"],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'House Siding',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ' Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: ' Setting'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ' About'),
        ],
      ),
    );
  }
}
