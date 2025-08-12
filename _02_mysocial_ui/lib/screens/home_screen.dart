import 'package:_02_mysocial_ui/data/data.dart';
import 'package:_02_mysocial_ui/theme/typography.dart';
import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:_02_mysocial_ui/widgets/following_users.dart';
import 'package:_02_mysocial_ui/widgets/post_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//new
import 'package:_02_mysocial_ui/theme/app_theme.dart'; //resp
import 'package:_02_mysocial_ui/utils/responsive.dart'; //theme

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
    );
    final text = Theme.of(context).textTheme; //THEME
    final primary = Theme.of(context).colorScheme.primary; // theme

    return Scaffold(
      //thene di sesuaikan  ikon status bar dgn mode temanya
      appBar: AppBar(
        title: Text(
          "FRENSTUDY",
          style: text.titleSmall?.copyWith(
            //THeme
            color: primary, //THEME
            letterSpacing: 8.0,
          ),
        ),
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu),
              ),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 4.0, //tebal garis tab
          labelColor: primary, //tHEME
          labelStyle: text.bodyLarge?.copyWith(
            fontWeight: AppTypography.semibold, //thEME
          ),
          unselectedLabelStyle: text.bodyLarge, //theme

          tabs: [Tab(text: "Trending"), Tab(text: "Latest")],
        ),
      ),
      drawer: AppDrawer(),
      body: ListView(
        //ditambahkan padding
        padding: Responsive.pagePadding(context), //resp center maxWidth
        children: [
          const SizedBox(height: AppTheme.sp16), //theme spacing
          FollowingUsers(),
          const SizedBox(height: AppTheme.sp16), //theme Spacing
          PostCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
          const SizedBox(height: AppTheme.sp24), //Theme Spaicing
        ],
      ),
    );
  }
}
