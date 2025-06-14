import 'dart:math';

import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:_02_mysocial_ui/data/data.dart';
import 'package:_02_mysocial_ui/widgets/post_carousel.dart';
import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/models/user_model.dart';
import 'package:_02_mysocial_ui/widgets/ProfileClipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _yourPostPageController;
  late PageController _favoritesPageController;
  @override
  void initState() {
    super.initState();
    _yourPostPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    _favoritesPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    //pakai globalKey

    return Scaffold(
      key: _scaffoldKey,

      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: ProfileClipper(),
                    child: Image(
                      height: 300,
                      width: double.infinity,
                      image: AssetImage(widget.user.backgroundImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //menu icon sebelah kiri atas !
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            iconSize: 30.0,
                            color: Colors.white,
                            onPressed:
                                () => _scaffoldKey.currentState?.openDrawer(),
                            icon: Icon(Icons.menu),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: (300 - 120),
                    left: MediaQuery.of(context).size.width / 2 - 60,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      //childnya container kita buat clipOval
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //dibawah stack kasih pading
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  widget.user.name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Row(
                //row ada 2 colummn
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Folowing',
                        style: TextStyle(color: Colors.black45, fontSize: 22.0),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        widget.user.following.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.black54, fontSize: 22.0),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        widget.user.followers.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //dibawha row Carouselnya
              PostCarousel(
                pageController: _yourPostPageController,
                title: 'Your Posts',
                posts: widget.user.posts,
              ),
              PostCarousel(
                pageController: _favoritesPageController,
                title: 'Your Favorites',
                posts: widget.user.favorites,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}



//mirip logiin screen  dibawha SingleScrollView tambahkan constrainBox 
//gak pakai appbar backgroudn  image ada diheader 
  
/*
               //clipath disini
                  ClipPath(
                    clipper: ProfileClipper(),
                    child: Image(
                      height: 300,
                      width: double.infinity,
                      image: AssetImage(widget.user.backgroundImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),


 //Safe Area
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: Icon(Icons.menu),
              ),
            ),
          ),
*/
  
  /*
cara kuno atur :
cara yg benar pakai stack+align +fractional offset  
 Positioned(
                    top: 300- 60(tinngi profile linkaran),
                    left: 135 ====>mediaQuery.of(context).width/2 - 60 (besar gmbar profile),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      //childnya container kita buat clipOval
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),



  */