import 'package:_01_mysocialmediaapp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:_01_mysocialmediaapp/screens/login_screen.dart';

//main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Socio UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: LoginScreen(),
      routes: {"/main": (context) => MainScreen()},
    );
  }
}
