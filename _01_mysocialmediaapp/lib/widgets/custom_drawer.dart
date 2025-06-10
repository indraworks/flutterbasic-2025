//kit abuat drawee sbgai statelesswidget

import 'package:_01_mysocialmediaapp/data/data.dart';
import 'package:_01_mysocialmediaapp/screens/Home_Screen.dart';
import 'package:_01_mysocialmediaapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  //buat function derawerOption dng param icon,title dan ontap func
  //FUnction diganti dgn VoidCallBack
  //utk Icon harus dgn IconData krn bisa error
  _buildDrawerOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 20.0)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //1 column ada dibagi ,column wrap dStack krn ada fto lingkar dan bacground image layer
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover, //box fit cover lebar image = lebar drawer
              ),
              //postioned utk buat image diatas background (wajah curent profile)
              Positioned(
                left: 10.0,
                bottom: 30.0,

                child: Row(
                  //supaay berada di bawah Y nya maka  dikasih end
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      //dalamnya boxDecoration/chilnya
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //sblah contaienrImage +SizedBox +TextCurentUser
                    SizedBox(width: 7.0),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //dibawahnya stack buat banyak Icon drawerNavigation  ada 6
          //kita buat functionya diatas
          _buildDrawerOption(
            Icons.dashboard,
            "Home",
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
          ),
          _buildDrawerOption(
            Icons.chat,
            'Chat',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatScreen()),
            ),
          ),
          _buildDrawerOption(Icons.map_rounded, 'Map', () {}),
        ],
      ),
    );
  }
}
