import 'package:_02_mysocial_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:_02_mysocial_ui/widgets/curve_clipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: Scaffold.of(context).openDrawer,
                icon: Icon(Icons.menu),
              ),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        //ganti sbgaiknya container dgn Sizebox utk wrapping
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  //utk lebar buat sleber2nya dgn constant double,infinity ( kiri kanan penuh)
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.jpg'),
                ),
              ),
              Text(
                "FRENDSTUDY",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 32.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 7.0,
                ),
              ),
              //1
              SizedBox(height: 10.0),
              Padding(
                //ini wrapper padding dari body masuk x=20 dari siis kanan-kiri, y=10
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
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
              //2
              SizedBox(height: 10.0),
              Padding(
                //ini wrapper padding dari body masuk x=20 dari siis kanan-kiri, y=10
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock, size: 30.0),
                  ),
                  obscureText: true,
                ),
              ),
              //seized box kit agunakan utk pemisah mirip margin tpi gak prlu buat
              //container krn kita butuh tinggi ,utk width sama dgn lebar body!
              SizedBox(height: 40.0),
              //mmbuat container utk tombol buuton login(dari boxDecoration) ,dibuat margin 60
              //container kit awrapper dgn new Widget gesture detector utk supaya bisa ontap
              //mirip onCLikc di react
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/main'),

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
              Expanded(
                child: Align(
                  //dgn alignment ini mirip self-alignment di flexbox
                  //ini kbawah paling ujung
                  //stlah Alignment ,sisa ruang bisa paka Expanded utk wraping sisa
                  //ruang yg ada !
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      height: 80.0,
                      child: Text(
                        ' dont\'t have account,Sign Up',
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
    );
  }
}
