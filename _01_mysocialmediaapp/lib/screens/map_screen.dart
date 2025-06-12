import 'package:_01_mysocialmediaapp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:_01_mysocialmediaapp/data/data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Map"),
        leading: IconButton(
          onPressed: () => MainScreen.of(context)?.openDrawer(),
          icon: Icon(Icons.menu),
        ),
      ),
    );
  }
}
