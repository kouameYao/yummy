import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/Miaou.jpg'),
            ),
            Text(
              'Angevald Dje',
              style: TextStyle(
                fontFamily: 'Pattaya',
                color: Colors.pink,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Software engineer',
              style: TextStyle(
                fontFamily: 'Pattaya',
                color: Colors.black87,
                letterSpacing: 2.5,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.pinkAccent,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.pinkAccent,
                ),
                title: Text(
                  '(+225) 01 71 60 00 70',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.pinkAccent,
                ),
                title: Text(
                  'angevaldddje@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
