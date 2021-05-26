import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yummy/screens/auth/login.dart';
import 'package:yummy/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Yumyum());
}

class Yumyum extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _initialization,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My-App',
            theme: ThemeData(
              //primaryColor: Theme.of(context).textTheme.headline6,
              primarySwatch: Colors.pink,
            ),
            home: snapshot.connectionState != ConnectionState.done
                ? LoginScreen()
                : HomeScreen(),
          );
        });
  }
}
