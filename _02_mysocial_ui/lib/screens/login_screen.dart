import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:_02_mysocial_ui/widgets/curve_clipper.dart';
//new utils and response
import 'package:_02_mysocial_ui/utils/responsive.dart'; // RESP
import 'package:_02_mysocial_ui/theme/app_theme.dart'; // THEME

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final text = Theme.of(context).textTheme; // THEME
    final primary = Theme.of(context).colorScheme.primary; // THEME

    //new Resp
    final headerHeight =
        Responsive.isMobile(context)
            ? MediaQuery.of(context).size.height / 3
            : MediaQuery.of(context).size.height / 2.5;

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Image.asset(
                        'assets/images/login_background.jpg',
                        height: headerHeight, // RESP
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "FRENSTUDY",
                      style: text.titleLarge?.copyWith(
                        // THEME
                        color: primary, // THEME
                        letterSpacing: 7.0,
                      ),
                    ),
                    const SizedBox(height: AppTheme.sp12), // THEME
                    Padding(
                      padding: Responsive.pagePadding(context), // RESP
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Username", // THEME InputDecorationTheme
                          prefixIcon: Icon(Icons.account_box, size: 26),
                        ),
                      ),
                    ),
                    Padding(
                      padding: Responsive.pagePadding(context), // RESP
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password", // THEME
                          prefixIcon: Icon(Icons.lock, size: 26),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.sp20), // THEME
                    Padding(
                      padding: Responsive.pagePadding(context), // RESP
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: FilledButton(
                          onPressed:
                              () => Navigator.pushReplacementNamed(
                                context,
                                '/home',
                              ),
                          child: Text(
                            "Login",
                            style: text.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ), // THEME
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.sp16),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(context, '/register'),
                          child: Container(
                            alignment: Alignment.center,
                            color: primary, // THEME
                            height: 80.0,
                            child: Text(
                              "Don't have an account? Sign Up",
                              style: text.titleSmall?.copyWith(
                                color: Colors.white,
                              ), // THEME
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.sp8), // THEME
              child: IconButton(
                icon: const Icon(Icons.menu, size: 30, color: Colors.white),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*************** OLD SCRIPT 
 * 
 *  return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Background Image with Curve
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Image.asset(
                        'assets/images/login_background.jpg',
                        //height: MediaQuery.of(context).size.height / 2.5,
                        height: headerHeight,//RESP
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Rest of the form
                    Text(
                      "FRENDSTUDY",
                      // style: TextStyle(
                      //   color: Theme.of(context).primaryColor,
                      //   fontSize: 32.5,
                      //   fontWeight: FontWeight.bold,
                      //   letterSpacing: 7.0,
                      // ),
                        style: text.titleLarge?.copyWith(              // THEME
                        color: primary,                              // THEME
                        letterSpacing: 7.0,
                      ),
                    ),
                    //const SizedBox(height: 10.0),
                    const SizedBox(height: AppTheme.sp12,), //THEME
                    Padding(
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 20.0,
                      //   vertical: 10.0,
                      // ),
                      padding: Responsive.pagePadding(context),      // RESP
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Username",
                          prefixIcon: Icon(Icons.account_box, size: 30.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock, size: 30.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap:
                          () =>
                              Navigator.pushReplacementNamed(context, '/home'),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 60.0),
                        alignment: Alignment.center,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(context, '/register'),
                          child: Container(
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            height: 80.0,
                            child: Text(
                              'Don\'t have an account? Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Menu Icon on top-left
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.menu, size: 30, color: Colors.white),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ),
        ],
      ),
    );
 * 
 * 
 * 
 * 
 * 
 */