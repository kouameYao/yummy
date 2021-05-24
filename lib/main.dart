import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yummy/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Yumyum());
}

class Yumyum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My-App',
      theme: ThemeData(
        //primaryColor: Theme.of(context).textTheme.headline6,
        primarySwatch: Colors.pink,
      ),
      home: LoginScreen(),
    );
  }
}
