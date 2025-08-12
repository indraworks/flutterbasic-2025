import 'package:flutter/material.dart';
//new utils dan theme
import 'package:_02_mysocial_ui/theme/app_theme.dart';
import 'package:_02_mysocial_ui/utils/responsive.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  //Buat WIdget LsitTIlenya biat gak ulagn2 buat ListStile!
  Widget buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    //theme
    final text = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ), //thHEME
      title: Text(title, style: text.bodyLarge), //theme
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    //variable for theme
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(AppTheme.sp12), //Theme
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: scheme.primary), //theme
            child: Text(
              "Main Menu",
              style: text.titleMedium?.copyWith(
                color: scheme.onPrimary,
              ), //theme
            ),
          ),
          SizedBox(height: Responsive.isMobile(context) ? 24 : 48), //RESP
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
