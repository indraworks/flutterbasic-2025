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
      title: 'Wisata Bandung',
      theme: ThemeData(),
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //kita wrap dgn widget SAfeArea kalau misalkan hape kita
      //itu punya status bar besar macam iphone dan sejenisnya
      body: SafeArea(
        child: Column(
          //supaya sisi horizontalnya ini jadi penuh ( sisi cross dari column)
          //jadi supaya lebar column tsb sblumnya diberi strecth dia hanya
          //sbsar lebar content tapi stlah di beri strect di max bisa selebahr halaman page
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //alt+enter (windows)
            //kita gunanaka pada linux ctrl + . ukt wraping si widget tahdi
            //bungkus dgn widget yglain pilihan di wrap dgn container
            Container(
              margin: EdgeInsets.only(top: 16.6),
              child: const Text(
                'Farm House Lembang',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            //ini COntainer ke-2 utk bikin
            //icon 3 open-everiday jam dan icon harga
            Container(
              //kita beri margin dari Container atas yg berisi judul
              margin: EdgeInsets.symmetric(vertical: 16.0),
              //kita buat row dgn maix Axis alignmentnya space evenly
              //trsusun horizontal dgn jarak yg sama
              child: Row(
                children: [
                  //wdiget  stlah row masing2 ada column
                  Column(),
                  Column(),
                  Column(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
