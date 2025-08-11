import 'package:flutter/material.dart';
import 'package:socio_network_dpindra/data/data.dart';
import 'package:socio_network_dpindra/screens/chat_screen.dart';
import 'package:socio_network_dpindra/screens/home_screen.dart';
import 'package:socio_network_dpindra/screens/login_screen.dart';
import 'package:socio_network_dpindra/screens/profile_screen.dart';

//BELAJAR DEBUG LINK :https://www.youtube.com/watch?v=_EYk-E29edo&t=172s
//utk debug flutter app dgn flutter devtools inspector ada di browser google

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation UI ',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/chat': (context) => ChatScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(user: currentUser),
      },
    );
  }
}
