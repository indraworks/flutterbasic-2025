import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  //Buat WIdget LsitTIlenya biat gak ulagn2 buat ListStile!
  Widget buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Main Menu",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(height: 50),
          buildListTile(
            context: context,
            icon: Icons.home,
            title: 'Home',
            routeName: '/home',
          ),
          buildListTile(
            context: context,
            icon: Icons.login,
            title: 'Login',
            routeName: '/login',
          ),
          buildListTile(
            context: context,
            icon: Icons.chat_bubble,
            title: 'Chat',
            routeName: '/chat',
          ),
          buildListTile(
            context: context,
            icon: Icons.map,
            title: 'Profile',
            routeName: '/profile',
          ),
        ],
      ),
    );
  }
}
