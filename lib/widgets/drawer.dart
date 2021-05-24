import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yummy/screens/about_screen.dart';
import 'package:yummy/screens/login.dart';
import 'package:yummy/screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Angevald DJE'),
            accountEmail: Text("azerty"),
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black87,
                size: 36.0,
              ),
              backgroundColor: Colors.pinkAccent,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(' My Yum Page'),
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
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About The Programmer'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AboutScreen();
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
