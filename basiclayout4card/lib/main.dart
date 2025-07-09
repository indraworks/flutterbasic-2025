import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Layout Demo",
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const HomeScreen(),
      routes: {
        '/page1': (context) => PageScreen1(),
        '/page2': (context) => PageScreen2(),
        '/page3': (context) => PageScreen3(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  //ini adalah constrcuter widget dimana utk context adalah
  //utk mendaftakan sudah tahu dimana letaknya dirinya !
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home Screen')),

      body: Column(
        children: [
          //Image grid Section -takes most of the space
          //expanded maksudnya ini 4 card nnti diposisikan agar isi diruang space yg trsedia
          //smacam declare flex di js!
          Expanded(
            child: Padding(
              //buat space pading dari parent sbesar 16 utk smua arah bidang
              padding: EdgeInsets.all(16.0),
              //penempatan gridview dng 2 column
              child: GridView.count(
                crossAxisCount: 2, //jumlah columnya
                mainAxisSpacing: 16.0, //space antar row (mainAxis)
                crossAxisSpacing: 16.0, //space antar colum
                //childrenya gridView
                children: [
                  //top-left Iamge
                  //buat containernya baru boxDecorationya
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(child: Text('image1')),
                  ),

                  //top-rgiht image
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(child: Text('image2')),
                  ),

                  //bottom-left-image
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 79, 224, 87),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(child: Text('image3')),
                  ),

                  //bottom-right-image
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 233, 17),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(child: Text('image4')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //mendefiniskan item yg merupakan type dari BottomnavigatioBarItem
        //yg mana sebgai aray karena kita punya 3 pages
        //dan nnti page ini activekan link  jika nnti di click
        //routing ke page link yg dituju!
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page1'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Page2'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Page3'),
        ],
        //declare curent index mulai
        currentIndex: 0,
        //action jika dclick/onTap
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/page1');
            case 1:
              Navigator.pushNamed(context, '/page2');
            case 2:
              Navigator.pushNamed(context, '/page3');
          }
        },
      ),
    );
  }
}

class PageScreen1 extends StatelessWidget {
  const PageScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page 1")),
      body: Center(child: Text('Content of Page 1')),
    );
  }
}

class PageScreen2 extends StatelessWidget {
  const PageScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(child: Text('Content of Page 2')),
    );
  }
}

class PageScreen3 extends StatelessWidget {
  const PageScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page 3')),
      body: Center(child: Text('Content of Page 3')),
    );
  }
}

/*

catatan :
Container -->Basic widget ygmana contain 1 buah chilkd dgn option padding,margins,decortion dll

2.padding. utk nambah space ruang skitar widget berdada ( utk spacing kedalam dari tempat parentnya )
3. ConstrainedBox : mengaplikasikan constraint utk anakya (ana k widget dimana jika butuh batasan2 maksimum ruang yg disediakan)
4.Expanded 



*/
