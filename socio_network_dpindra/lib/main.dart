import 'package:flutter/material.dart';
import 'package:socio_network_dpindra/data/data.dart';
import 'package:socio_network_dpindra/screens/chat_screen.dart';
import 'package:socio_network_dpindra/screens/home_screen.dart';
import 'package:socio_network_dpindra/screens/login_screen.dart';
import 'package:socio_network_dpindra/screens/profile_screen.dart';
import 'package:socio_network_dpindra/utils/app_theme.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  //func toggle theme
  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendStudy',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? AppTheme.darkTheme() : AppTheme.lightTheme(),
      home: LoginScreen(toggleTheme: toggleTheme),
    );
  }
}
