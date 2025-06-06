import 'package:flutter/material.dart';
import 'users.dart';

void main() {
  runApp(UserProfileApp()); //ilangi constnya karena gak dipakai
  //sama compile tuk optimasi terus menerus
}

class UserProfileApp extends StatelessWidget {
  //const UserProfileApp({super.key});
  UserProfileApp({super.key});

  // Sample data
  final List<User> users = [
    User(name: 'Alice', profileImageUrl: 'https://i.pravatar.cc/150?img=1'),
    User(name: 'Bob', profileImageUrl: 'https://i.pravatar.cc/150?img=2'),
    User(name: 'Charlie', profileImageUrl: 'https://i.pravatar.cc/150?img=3'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User Profiles')),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.profileImageUrl),
              ),
              title: Text(user.name),
            );
          },
        ),
      ),
    );
  }
}
