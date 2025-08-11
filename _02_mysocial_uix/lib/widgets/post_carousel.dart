import 'package:flutter/material.dart';

import 'package:_02_mysocial_ui/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  //field local
  final PageController pageController;
  final String title;
  final List<Post> posts; //variable list/array bertype Post ( dari model post)

  //consturctor
  const PostCarousel({
    super.key,
    required this.pageController,
    required this.title,
    required this.posts,
  });

  //local func
  ////utk BuiltContext adalah class yg merrpresentasi kan siwidget ada dimana ,dicabang2 widget tree diseluruh aplikasi
  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    //stack isi banyak widget/object ex:image yg bertumpuk dalam layer
    //kita bungkus wraper dgn imageBuilder
    return AnimatedBuilder(
      animation: pageController,
      //child yg passing param Widget adalah :child :Stacl -->dan turunannya
      builder: (BuildContext context, Widget? child) {
        double value = 1;
        if (pageController.position.hasContentDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400,
            child:
                child, //child yg masuk sini brasal dari child yg isinya : Stack
          ),
        );
      },
      child: Stack(
        //ini child yg passing ke kedalam builder isinya Stack smua
        children: [
          //image backround with border dan shadow
          Container(
            margin: EdgeInsets.all(10.0),
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
            //image background bawah di lciprect
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
          //positioned ->nambah object diatas bakcgroudn image
          Positioned(
            //atur letak  container box poisi dibawah diatas image background
            left: 10,
            bottom: 10,
            right: 10,

            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white54,
                //dicircle kiri kanan
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              //isi text2 diatas  Container box
              child: Column(
                children: [
                  Text(post.title, style: TextStyle()),
                  Text(post.location, style: TextStyle()),
                  Row(
                    //buat like dan favorites krikanan
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //isinya icon dan text like
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
                          //isinya icon dan text favorite
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

  //Main UI build disini
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title carouselnya
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        //carauselnya slider it-self
        Container(
          height: 400,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,

            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        ),
      ],
    );
  }
}
