import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socio_network_dpindra/data/data.dart';
import 'package:socio_network_dpindra/widgets/app_drawer.dart';
import 'package:socio_network_dpindra/widgets/following_users.dart';
import 'package:socio_network_dpindra/widgets/post_carausel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//pakai mixin atau extendnya dgn SingleTickerProviderStateMixin karena memakai tab dan page !
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //mmbuat 2 buah tab
  late TabController _tabController;
  late PageController _pageController;

  //initial state utk tab dan page
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  //dispose utk clear remove dari screen ktika away berpindah
  @override
  void dispose() {
    _tabController.dispose();
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
        title: Text(
          "FRENSTUDY",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 8.0,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu),
          ),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 5.0, //tebal garis tab
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
          unselectedLabelStyle: TextStyle(fontSize: 18),

          tabs: [
            Tab(text: "Trending"),
            Tab(text: "Latest"),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
