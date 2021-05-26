import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Favorite",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Icon(Icons.favorite, size: 30.0),
        ],
      ),
    );
  }
}
