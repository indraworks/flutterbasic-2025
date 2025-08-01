import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Center(
          //BiggerText adalah class dimana kita msuka parameter
          //BiggerTExt adalah statefullWidget dimana control button
          //ditekan maka akan ada perubahan pada tulisan
          child: BiggerText(text: 'Hello Andra'),
        ),
      ),
    );
  }
}
//ini stateLess Widget
//gak dipakai karena kita aka gunakan state utk itu maka
//dengan statefull widget kita hanya bisa ubah stastenya
//state lesswidget tidak ada state garing ! makanya namanya statelwss widget

class BiggerText extends StatefulWidget {
  final String text;
  const BiggerText({super.key, required this.text});

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.8;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _textSize = 32.0;
            });
          },

          child: Text("Perbesar"),
        ),
      ],
    );
  }
}
