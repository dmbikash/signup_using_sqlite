import 'package:flutter/material.dart';
import 'package:signup_using_sqlite/screen/CarPage.dart';
import 'package:signup_using_sqlite/screen/LoginForm.dart';
import 'package:signup_using_sqlite/screen/SignupForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup Using Swlite',
      initialRoute: 'LoginForm',
      routes:{
        'LoginForm' : (context) => LoginForm(),
        "SignupForm" :(context) => SignupForm(),
        "CarPage" : (context) => CarPage(),
      },
      home: LoginForm(),
    );
  }
}

