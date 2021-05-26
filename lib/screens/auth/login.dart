import 'package:firebase_auth/firebase_auth.dart';
import 'package:yummy/screens/home/tab_screen.dart';
import 'package:flutter/material.dart';
import 'Create.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: size.height * 0.6,
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Into',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      Text(
                        'YumYum',
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onChanged: (value) {
                          value = emailController.text;
                          print(value);
                        },
                        decoration: InputDecoration(labelText: 'E-mail'),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: passwordController,
                        onChanged: (value) {
                          value = passwordController.text;
                          print(value);
                        },
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          try {
                            auth
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TabScreen();
                                  },
                                ),
                              );
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (Context) {
                                return CreateScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
