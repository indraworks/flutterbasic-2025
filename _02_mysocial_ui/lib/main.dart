import 'package:_02_mysocial_ui/data/data.dart';

import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/screens/home_screen.dart';
import 'package:_02_mysocial_ui/screens/login_screen.dart';
import 'package:_02_mysocial_ui/screens/profile_screen.dart';
import 'package:_02_mysocial_ui/screens/chat_screen.dart';

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
        '/chat': (context) => ChatScreen(),
        '/home': (context) => HomeScreen(),
        // '/chat': (context) => ChatScreen(),
        '/profile': (context) => ProfileScreen(user: currentUser),
      },
    );
  }
}
