import 'package:firebase_auth/firebase_auth.dart';
// import 'package:yummy/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:yummy/screens/login.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      'Create',
                      style: TextStyle(
                        fontSize: size.width * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your',
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                      ),
                    ),
                    Text(
                      'Yum Account',
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
                      key: ValueKey("azer"),
                      controller: emailController,
                    ),
                    TextField(
                      key: ValueKey("pass"),
                      controller: passwordController,
                      onChanged: (value) {
                        value = passwordController.text;
                        print(value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        try {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
