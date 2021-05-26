import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Icon(Icons.person, size: 30.0),
        ],
      ),
    );
  }
}
