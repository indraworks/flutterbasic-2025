import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register '),
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: Scaffold.of(context).openDrawer,
                icon: Icon(Icons.menu),
              ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text("Register Screen")),
    );
  }
}
