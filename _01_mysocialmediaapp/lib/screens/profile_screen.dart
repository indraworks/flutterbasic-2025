import 'package:_01_mysocialmediaapp/models/user_model.dart';
import 'package:_01_mysocialmediaapp/data/data.dart';
import 'package:_01_mysocialmediaapp/screens/main_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  //utk masukan dari param screen lain kita buat filed variable ytk msuk di construtor
  final User user;

  const ProfileScreen({required this.user, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //gak pakai GLobalKey gak clean
  //pakai  type globalkey field utk action  ke drawer (balik)
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //Scafold jgn pakai constant nnti param gak masuk !
    //smua screen lewat button dwarer dibalikan sbga main_screen

    return Scaffold(
      //buat barDrawe di app bar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),

          onPressed: Scaffold.of(context).openDrawer,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  //atur besar/tingi
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 300,
                  image: AssetImage(widget.user.backgroundImageUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
