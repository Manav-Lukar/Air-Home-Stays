import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(), // Welcome Screen
        '/login': (context) => LoginScreen(), // LoginScreen
        '/signup': (context) => SignUpScreen(), //  SignUpScreen
      },
    );
  }
}
