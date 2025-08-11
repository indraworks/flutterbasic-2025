import 'package:flutter/material.dart';

class ContainerChild extends StatelessWidget {
  const ContainerChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //kita tentukan besar container kita
      //dengan property widh,height color
      //nah childnya kita panggil adalah Text sbgai child
      //dalam container ini !
      child: Text("Hello iam under the container"),
    );
  }
}


/*
contoh yang paling lengkap untuk container ada pada geeks for geeks 






*/