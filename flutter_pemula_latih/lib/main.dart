import 'package:flutter/material.dart';
import 'package:flutter_pemula_latih/01_widget/Heading.dart';
import 'package:flutter_pemula_latih/02_container/01ContainerChild.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Container Example",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Container(child: ContainerChild()),

        //01_widget
        // body: Center(
        //   //kita panggil class StateFull BiggerText
        //   child: BiggerText(text: "Hello World"),
        // ),
        //02_container-contoh:
      ),
    );
  }
}

/*
jika panggil class2 01COntainerChild() dan 02COntainerNext() dan so on 
maka lewat body:nanaClass() tapi tidak langsung jadi panggilnya mesti 
lewat container atau center nah di childnya itu  karena dia muncul sebgai 
sbuah widget maka yang tampil visual dulu itu yg di panggil 
baru class kita yg didalam ! 



*/
