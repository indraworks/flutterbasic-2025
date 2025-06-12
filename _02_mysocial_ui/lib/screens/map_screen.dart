import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu),
              ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('Map Screen')),
    );
  }
}
