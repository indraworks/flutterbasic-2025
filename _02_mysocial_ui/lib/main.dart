import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/screens/home_screen.dart';
import 'package:_02_mysocial_ui/screens/login_screen.dart';
import 'package:_02_mysocial_ui/screens/map_screen.dart';
import 'package:_02_mysocial_ui/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation UI',
      theme: ThemeData(primarySwatch: Colors.blue),

      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        // '/chat': (context) => ChatScreen(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}
