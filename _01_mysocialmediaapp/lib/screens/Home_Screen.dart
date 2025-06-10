import 'package:_01_mysocialmediaapp/data/data.dart';
import 'package:_01_mysocialmediaapp/widgets/custom_drawer.dart';
import 'package:_01_mysocialmediaapp/widgets/following_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:_01_mysocialmediaapp/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //preparevariabel tabCOn dgn typedata TAbController
  late TabController _tabController; //pakai late utk initialize later !
  //declare PageController dgn late
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //utk viewportFraction adalah jumlah dari post yg akan ditampilkan discreen
    //sblum scroll(kiri-kanan) ada bagian kiri kanan yg ditampikan besanny berapa?
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //diberi brightnes supaay warna sama
    //brightness:Brightness.light, tidak bisa dipakai old
    //pakai systemChrome service
    //set text dark jika background terang
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          "FRENSTUDY",
          style: TextStyle(
            color: Theme.of(context).primaryColor,

            fontWeight: FontWeight.bold,
            letterSpacing: 8.0,
          ),
        ),
        //mmbuat tabBar pada bottom apBar
        bottom: TabBar(
          //harus pake controller variable utk tapung _tabController
          controller: _tabController,
          indicatorWeight: 5.0, //garis2 tab
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: <Widget>[Tab(text: "Trending"), Tab(text: "Latest")],
        ),
      ),
      //baurt drawer diatas body
      drawer: CustomDrawer(),

      //buat list view bisa scrollup-down dibawah tabbar
      body: ListView(
        children: [
          FollowingUsers(),
          //kita buat PostCarouselnya disini
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
