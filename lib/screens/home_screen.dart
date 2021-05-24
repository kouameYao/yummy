import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var triangle;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            FirebaseAuth.instance.currentUser.uid,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Icon(Icons.house, size: 30.0),
        ],
      ),
    );
  }
}
