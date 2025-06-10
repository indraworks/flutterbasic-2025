import 'package:_01_mysocialmediaapp/data/data.dart';
import 'package:_01_mysocialmediaapp/models/user_model.dart';
import 'package:flutter/material.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //utk column yg crossAxis adlah yg mendatar kiri-kanan
      //yg main adalah yg atas-bawah
      crossAxisAlignment: CrossAxisAlignment.start, //start dari kiri
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.00, 20.00, 20.00, 10.0),
          child: Text(
            "Following",
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          height: 80,
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            //geser kiri kanannya pakai scroll axis
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              //yg direturn img-nya
              //kita wrap dgn container baru bisa buat linkaran border dgn cara
              //imagenya di wrappung dgn widget ClipOval
              //wrap dgn gesture detector agar nnti ditap bisa ke users(index)
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    //supaya shadownya cricle
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    //gasih border warna biru di circlenya
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(user.profileImageUrl),
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
