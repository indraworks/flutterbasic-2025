//stl statelesswidget
//sts //statefullwidget

import 'package:_01_mysocialmediaapp/models/post_model.dart';
import 'package:flutter/material.dart';
//yg dari home masuk kesini PostCarousel

class PostsCarousel extends StatelessWidget {
  //local fiedlnya
  final PageController pageController;
  final String title;
  final List<Post> posts;
  //super key dimasukan dalam named constructornya karen brasaldari stless! parent class
  // //Constructornya
  const PostsCarousel({
    super.key,
    required this.pageController,
    required this.title,
    required this.posts,
  });

  //local func
  //utk BuiltContext adalah class yg merrpresentasi kan siwidget ada dimana ,dicabang2 widget tree diseluruh aplikasi
  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    //stack utk isi banyak card/widget dalam layer atau contaienr
    //kita wrapper dgn animatedBuilder
    return AnimatedBuilder(
      animation: pageController,
      //biar bisa lalukan null/undefined diberi pada widget ?
      builder: (BuildContext context, Widget? child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400,
            child: child,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),

            //bacgroud colirnya
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            //mmbuat anak utk iamge dalam boxDecor diwrapp dgn ClipRRect
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: AssetImage(post.imageUrl),
                height: 400,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              //supaya bisa kebawah COntainer diwwapr sama widget Positioned
              padding: EdgeInsets.all(12.0),
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.white54,
                //bawah kiri kanan saja
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              //child Container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 6.0),

                          Text(
                            post.likes.toString(),
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            post.comments.toString(),
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //isinya adalah huruf Post dan Image2 Corusel yg sedang dipostkan
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        //buat container tempat pageView Caroselnya
        Container(
          height: 400.0,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index); //local func mesti return
            },
          ),
        ),
      ],
    );
  }
}

/*
Apa itu konteks BuildContext?
BuildContext adalah tipe (kelas) yang mewakili lokasi widget di pohon/cabang2 widget.

Parameter konteks:

Memberikan akses ke widget parents dan tema/data yang mungkin diperlukan

Diperlukan untuk banyak operasi Flutter (seperti menampilkan dialog, menavigasi, dll.)

Berisi informasi tentang posisi widget di dicabang3 pohon/tree 



*/
