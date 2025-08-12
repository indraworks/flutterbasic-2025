import 'package:_02_mysocial_ui/data/data.dart';

import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/screens/home_screen.dart';
import 'package:_02_mysocial_ui/screens/login_screen.dart';
import 'package:_02_mysocial_ui/screens/profile_screen.dart';
import 'package:_02_mysocial_ui/screens/chat_screen.dart';

import 'package:_02_mysocial_ui/theme/app_theme.dart'; // THEME
import 'package:_02_mysocial_ui/theme/theme_controller.dart'; // THEME yg new utk drawer

//BELAJAR DEBUG LINK :https://www.youtube.com/watch?v=_EYk-E29edo&t=172s
//utk debug flutter app dgn flutter devtools inspector ada di browser google

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //materaial ap bungkus dgn builder ValiueListenableBuilder
    //supaya material rebuild saatThemenyta berubah
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.instance.mode,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FRENSTUDY',
          //theme: ThemeData(primarySwatch: Colors.blue),
          theme: AppTheme.light, //THEME
          darkTheme: AppTheme.dark, //THEME
          themeMode: mode, //THEME
          initialRoute: '/home',
          routes: {
            '/login': (context) => LoginScreen(),
            '/chat': (context) => ChatScreen(),
            '/home': (context) => HomeScreen(),
            // '/chat': (context) => ChatScreen(),
            '/profile': (context) => ProfileScreen(user: currentUser),
          },
          //utk Argument dinamis dimasa mendatang
          onGenerateRoute: (settings) {
            if (settings.name == '/profile' && settings.arguments != null) {
              final args = settings.arguments;
              if (args is Map && args['user'] != null) {
                return MaterialPageRoute(
                  builder: (_) => ProfileScreen(user: args['user']),
                );
              }
            }
          },
        );
      },
    );
  }
}
