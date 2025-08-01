import 'package:flutter/material.dart';
import 'package:flutter_pemula_latih/01_widget/Heading.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          //kita panggil class StateFull BiggerText
          child: BiggerText(text: "Hello World"),
        ),
      ),
    );
  }
}
