//kit abuat drawee sbgai statelesswidget

import 'package:_01_mysocialmediaapp/data/data.dart';
import 'package:_01_mysocialmediaapp/screens/Home_Screen.dart';
import 'package:_01_mysocialmediaapp/screens/chat_screen.dart';
import 'package:_01_mysocialmediaapp/screens/login_screen.dart';
import 'package:_01_mysocialmediaapp/screens/profile_screen.dart';
import 'package:_01_mysocialmediaapp/screens/map_screen.dart';

import 'package:flutter/material.dart';

//utk atur perpindahan navigate buat mainscreen dan buat state
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  //ahrus taruh static disni utk scapoldnya baru bisa kerja!
  static ScaffoldState? of(BuildContext context) {
    final state = context.findAncestorStateOfType<_MainScreenState>();
    return state?._scaffoldKey.currentState;
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Buat GlobalKey di mainnya
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(user: currentUser),
    MapScreen(),
    //LoginScreen(),
    // Note: index 4 (Settings) – currently placeholder
    Center(child: Text('Settings')),
  ];

  //buat function
  void _onDrawerItemSelected(int index) {
    Navigator.pop(context); //close drawernya baru ke navivate screen lain
    if (index == 5) {
      //Logout logic navigate ke Login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        //onItemSelected adalan field local di ClustomDrawer
        //terima arg param _onDrawerItemSelected
        onItemSelected: _onDrawerItemSelected,
      ),
      body: _screens[_currentIndex],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({super.key, required this.onItemSelected});
  //kalau buat widget wajib ada context dgn type BuildContext
  //m,buat Widget berupa Optionnya lengkap dgn icon dan tap utk navigae ke screen lain!
  //widget ini dipasang di Drawer based on List<widget> diatas! udah kita declare!
  Widget _buildDrawerOption(
    BuildContext context,
    icon,
    String title,
    int index,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 20.0)),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onItemSelected(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 10.0,
                bottom: 30.0,
                child: Row(
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
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
          _buildDrawerOption(context, Icons.dashboard, "Home", 0),
          _buildDrawerOption(context, Icons.chat, 'Chat', 1),
          _buildDrawerOption(context, Icons.map_rounded, 'Map', 3),
          _buildDrawerOption(context, Icons.account_circle, "Your Profile", 2),
          _buildDrawerOption(context, Icons.settings, 'Settings', 4),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                context,
                Icons.directions_run,
                "Logout",
                5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*Ganti smua BuidDrawer pakai statePop sblum masuk ke masing2 screen! 

  //dibawahnya stack buat banyak Icon drawerNavigation  ada 6
          //kita buat functionya diatas
          _buildDrawerOption(
            Icons.dashboard,
            "Home",
            //use pushReplacement kalau push saja nnti numpuk!
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
          ),
          _buildDrawerOption(
            Icons.chat,
            'Chat',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ChatScreen()),
            ),
          ),
          _buildDrawerOption(Icons.map_rounded, 'Map', ()=>Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_)=>MapScreen()))),

          _buildDrawerOption(
            Icons.account_circle,
            "Your Profile",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: currentUser),
              ),
            ),
          ),
          _buildDrawerOption(Icons.settings, 'Settings', () {}),
          //utk taruh plig bwah kasih expanded,alignmentnya  bottomCenter
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              //masukan _build.. di childnya !
              child: _buildDrawerOption(
                Icons.directions_run,
                "Logout",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
              ),
            ),
          ),
        ],







*/
